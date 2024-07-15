// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import './flutterflow_merge.dart';
import './utils.dart';

Future<void> stashChanges(final String message) async {
  info('Stashing local changes...');
  final stashResult =
      await Process.run('git', ['stash', 'push', '-m', message]);
  if (stashResult.exitCode != 0) {
    fatalError('Failed to stash local changes: ${stashResult.stderr}');
  }
  info('Stash result: ${stashResult.stdout}');
}

Future<void> unstashChanges(final String message) async {
  info('Listing stashes...');
  final listStashesResult = await Process.run('git', ['stash', 'list']);
  if (listStashesResult.exitCode != 0) {
    fatalError('Failed to list stashes: ${listStashesResult.stderr}');
  }

  final stashes = (listStashesResult.stdout as String).split('\n');
  String? stashId;
  for (final stash in stashes) {
    if (stash.contains(message)) {
      stashId = stash.split(':').first.trim();
      break;
    }
  }

  if (stashId == null) {
    info('No stash found with the message: $message');
    return;
  }

  info('Popping stash $stashId...');
  final popResult = await Process.run('git', ['stash', 'pop', stashId]);
  if (popResult.exitCode != 0) {
    fatalError('Failed to pop the stash $stashId: ${popResult.stderr}');
  }
  info('Pop result: ${popResult.stdout}');
}

Future<void> fetchLatest() async {
  final fetchResult =
      await Process.run('git', ['fetch', 'origin', config.source_branch]);
  if (fetchResult.exitCode != 0) {
    fatalError('Error fetching branch: ${fetchResult.stderr}');
  }
  info('Fetch result: ${fetchResult.stdout}');
}

Future<void> resetBranch() async {
  final resetResult = await Process.run('git', [
    'update-ref',
    'refs/heads/${config.source_branch}',
    'refs/remotes/origin/${config.source_branch}',
  ]);
  if (resetResult.exitCode != 0) {
    fatalError('Error resetting branch: ${resetResult.stderr}');
  }
  info('Reset result: ${resetResult.stdout}');
}

Future<String> createNewBranch(final String currentBranch) async {
  final shortCommitHashResult =
      await Process.run('git', ['rev-parse', '--short', 'HEAD']);
  if (shortCommitHashResult.exitCode != 0) {
    fatalError(
      'Failed to get short commit hash: ${shortCommitHashResult.stderr}',
    );
  }
  final shortCommitHash = (shortCommitHashResult.stdout as String).trim();

  final newBranch = 'flutterflow-merge-$currentBranch-$shortCommitHash';
  info('Creating new branch $newBranch from $currentBranch...');

  final createBranchResult =
      await Process.run('git', ['checkout', '-b', newBranch, currentBranch]);
  if (createBranchResult.exitCode != 0) {
    fatalError(
      'Failed to create new branch $newBranch: ${createBranchResult.stderr}',
    );
  }

  info('New branch $newBranch created successfully.');
  return newBranch;
}

Future<void> changeBranch(
  final String branchName, {
  final bool force = false,
}) async {
  info('Switching to branch $branchName...');

  final args = ['checkout'];
  if (force) {
    args.add('-f');
  }
  args.add(branchName);

  final changeBranchResult = await Process.run('git', args);
  if (changeBranchResult.exitCode != 0) {
    fatalError(
      'Failed to switch to branch $branchName: ${changeBranchResult.stderr}',
    );
  }
  info('Switched to branch $branchName successfully.');
}

Future<void> checkoutFilesAndFolders(
  final String sourceBranch,
  final List<String> paths,
) async {
  // Construct the arguments for the git checkout command
  final args = ['checkout', sourceBranch, '--', ...paths];

  // Execute the git checkout command
  final checkoutResult = await Process.run('git', args);
  if (checkoutResult.exitCode != 0) {
    fatalError(
      'Failed to checkout folders and files from $sourceBranch: ${checkoutResult.stderr}',
    );
  }
  info(
    'Successfully checked out folders and files from $sourceBranch: ${checkoutResult.stdout}',
  );
}

Future<void> stageAndCommitAllFiles(final String commitMessage) async {
  info('Staging all files...');

  // Execute the git add command to stage all files
  final addResult = await Process.run('git', ['add', '--all']);
  if (addResult.exitCode != 0) {
    fatalError('Failed to stage all files: ${addResult.stderr}');
  }
  info('All files staged successfully.');

  // Execute the git commit command to commit the staged files
  info('Committing staged files...');
  final commitResult =
      await Process.run('git', ['commit', '-m', commitMessage]);
  if (commitResult.exitCode != 0) {
    fatalError('Failed to commit staged files: ${commitResult.stderr}');
  }
  info('Files committed successfully: ${commitResult.stdout}');
}

Future<void> mergeBranch(
  final String newBranch,
  final String currentBranch,
) async {
  final mergeMessage = 'Merge updates from $newBranch';
  info('Merging $newBranch into $currentBranch...');

  final mergeResult = await Process.run(
    'git',
    ['merge', '--no-ff', '-m', mergeMessage, newBranch],
  );
  if (mergeResult.exitCode != 0) {
    fatalError('Failed to merge $newBranch: ${mergeResult.stderr}');
  }
  info(
    'Merged $newBranch into $currentBranch successfully: ${mergeResult.stdout}',
  );
}

Future<void> deleteBranch(final String branchName) async {
  info('Cleaning up temporary branch $branchName...');

  final deleteResult = await Process.run('git', ['branch', '-d', branchName]);
  if (deleteResult.exitCode != 0) {
    fatalError('Failed to delete branch $branchName: ${deleteResult.stderr}');
  }
  info('Branch $branchName deleted successfully: ${deleteResult.stdout}');
}

Future<void> cleanWorkingDirectory() async {
  info('Cleaning up working directory...');

  final cleanResult = await Process.run('git', ['clean', '-df']);
  if (cleanResult.exitCode != 0) {
    fatalError('Failed to clean up working directory: ${cleanResult.stderr}');
  }
  info('Working directory cleaned successfully: ${cleanResult.stdout}');
}
