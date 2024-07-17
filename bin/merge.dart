import 'dart:io';
import './configuration_parser.dart';
import './file_operations.dart';
import './git_functions.dart';
import './structures.dart';
import './utils.dart';

late final FlutterflowMergeConfig config;

const stashMessage = 'Temporary stash during flutterflow merge process';

void main() async {
  // Get the config preferences from the pubspec.yaml
  config = await parseConfig();

  // Stash any local changes with a specific message. This will be popped at the end of the script
  await stashChanges(stashMessage);

  // Fetch the target branch to ensure we have the latest changes downloaded
  info('Fetching latest changes from origin...');
  await fetchLatest();

  // Reset the branch to the latest commit from origin without checking it out
  info('Resetting branch to latest commit from origin...');
  await resetBranch();

  // Create a new branch from the target branch with a unique name
  info('Creating a new branch from the target branch...');
  final newBranch = await createNewBranch(config.working_branch!);

  // Change to the new branch
  info('Changing to the new branch...');
  await changeBranch(newBranch);

  // Remove all files and folders from the destination except the ones that are ignored
  info(
    'Removing all files and folders from the destination except the ones that are ignored...',
  );
  for (final target in config.dart_targets + config.other_targets) {
    await removeItems(
      target.destination,
      Directory.current,
      [
        ...config.ignore_items,
      ],
      false,
    );
  }

  // Move all source files to a temporary folder
  info('Moving target sources to temporary folder...');
  await moveTargetsToTempFolder([
    ...config.dart_targets.map((final e) => e.source),
    ...config.other_targets.map((final e) => e.source),
  ]);

  // Checkout the files and folders from the source branch to the source
  info('Checking out files and folders from the source branch...');
  await checkoutFilesAndFolders(
    config.source_branch,
    [
      ...config.dart_targets.map((final e) => e.source),
      ...config.other_targets.map((final e) => e.source),
    ],
  );

  // Move all targets to their destinations
  info('Moving all targets to their destinations...');
  await moveMergeTargets([
    ...config.dart_targets,
    ...config.other_targets,
  ]);

  // Remove all IGNORED files and folders from the destination
  info('Removing all IGNORED files and folders from the destination...');
  for (final target in config.dart_targets + config.other_targets) {
    await removeItems(
      target.destination,
      Directory.current,
      [
        ...config.ignore_items,
      ],
      true,
    );
  }

  // Run dart fix on the updated files
  info('Running dart fix on the updated files...');
  if (config.features.apply_dart_fix) {
    await runDartFix();
  }

  // Find and replace the specified strings in the files
  info('Finding and replacing the specified strings in the files...');
  await findAndReplaceInFiles(
    config.replacements,
    [
      ...config.dart_targets.map((final e) => e.destination),
    ],
  );

  // Wrap the specified functions in the files
  info('Wrapping the specified functions in the files...');
  await wrapDartFunctionsInFiles(
    config.function_wraps,
    [
      ...config.dart_targets.map((final e) => e.destination),
    ],
  );

  // Copy the files from the temporary folder back to the destination
  info(
    'Copying the files from the temporary folder back to the destination...',
  );
  await mergeBackTargetsFromTemp([
    ...config.dart_targets,
    ...config.other_targets,
  ]);

  // Run dart fix on the updated files
  info('Running dart fix on the updated files...');
  if (config.features.apply_dart_fix) {
    await runDartFix();
  }

  // Run dart format on the updated files
  info('Running dart format on the updated files...');
  await formatAllFiles(
    [
      ...config.dart_targets.map((final e) => e.destination),
    ],
  );

  // Run dart fix on the updated files
  info('Running dart fix on the updated files...');
  if (config.features.apply_dart_fix) {
    await runDartFix();
  }

  // Run dart format on the updated files
  info('Running dart format on the updated files...');
  await formatAllFiles(
    [
      ...config.dart_targets.map((final e) => e.destination),
    ],
  );

  // Stage and commit all the changes
  info('Staging and committing all the changes...');
  await stageAndCommitAllFiles(
    'Move, format, and fix code in selected folders and files from branch ${config.source_branch}',
  );

  // Switch back to the original branch
  info('Switching back to the original branch...');
  await changeBranch(config.working_branch!, force: true);

  // Merge the new branch into the original branch
  info('Merging the new branch into the original branch...');
  await mergeBranch(newBranch, config.working_branch!);

  // Delete the new branch
  info('Deleting the new branch...');
  await deleteBranch(newBranch);

  // Clean up the working directory
  info('Cleaning up the working directory...');
  await cleanWorkingDirectory();

  // Unstash changes
  info('Unstashing changes...');
  await unstashChanges(stashMessage);
}
