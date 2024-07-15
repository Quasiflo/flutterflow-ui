// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import './structures.dart';
import './utils.dart';

Future<void> removeItems(
  final String destFolder,
  final List<String> ignoredItems,
  final bool removeIgnoredOrEverythingElse,
) async {
  final directory = Directory(destFolder);
  if (!await directory.exists()) {
    info('Destination folder does not exist: $destFolder');
    return;
  }

  await for (final entity
      in directory.list(recursive: true, followLinks: false)) {
    final relativePath =
        entity.path.replaceFirst(directory.path + Platform.pathSeparator, '');
    if (removeIgnoredOrEverythingElse
        ? isIgnored(relativePath, ignoredItems)
        : !isIgnored(relativePath, ignoredItems)) {
      try {
        if (entity is File) {
          // info('Deleting file: ${entity.path}');
          await entity.delete();
        } else if (entity is Directory) {
          // info('Deleting directory: ${entity.path}');
          await entity.delete(recursive: true);
        }
      } on FileSystemException catch (e) {
        fatalError('Failed to delete ${entity.path}: $e');
      }
    }
  }
}

Future<void> moveTargetsToTempFolder(final List<String> targets) async {
  // Get the temporary directory path
  final tempDir =
      path.join((await getTemporaryDirectory()).path, 'flutterflow_merge');

  // Remove existing temporary folder if it exists
  if (await Directory(tempDir).exists()) {
    info('Removing existing temporary folder $tempDir...');
    try {
      await Directory(tempDir).delete(recursive: true);
    } on FileSystemException catch (e) {
      fatalError('Failed to remove existing temporary folder $tempDir: $e');
    }
    info('Temporary folder $tempDir removed successfully.');
  }

  // Move the targets to the temporary folder
  for (final target in targets) {
    final targetDir = Directory(target);
    final tempTargetPath = '$tempDir/$target';

    // Make the temp dir
    try {
      await Directory(tempDir).create(recursive: true);
    } on FileSystemException catch (e) {
      fatalError('Failed to create temporary folder $tempDir: $e');
    }
    info('Temporary folder $tempDir created successfully.');

    // Move the target directory to the temporary folder
    info('Moving $target to $tempTargetPath...');
    try {
      await targetDir.rename(tempTargetPath);
    } on FileSystemException catch (e) {
      fatalError('Failed to move $target to $tempTargetPath: $e');
    }
    info('$target moved to $tempTargetPath successfully.');
  }
}

Future<void> runDartFix() async {
  info('Running dart fix on the updated files...');

  // Execute the dart fix command
  final fixResult = await Process.run('dart', ['fix', '--apply']);
  if (fixResult.exitCode != 0) {
    fatalError('Failed to apply dart fixes: ${fixResult.stderr}');
  }
  info('Dart fixes applied successfully: ${fixResult.stdout}');
}

Future<void> findAndReplaceInFiles(
  final List<Replacement> replacements,
  final List<String> targets,
) async {
  for (final target in targets) {
    final directory = Directory(target);
    if (!await directory.exists()) {
      info('Target directory does not exist: $target');
      continue;
    }

    await for (final entity
        in directory.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        final content = await entity.readAsString();
        final updatedContent = findAndReplace(content, replacements);
        await entity.writeAsString(updatedContent);
        info('Processed file: ${entity.path}');
      }
    }
  }
}

String findAndReplace(
  final String sourceCode,
  final List<Replacement> replacements,
) {
  var resultCode = sourceCode;

  for (final replacement in replacements) {
    if (replacement.regex) {
      final regExp = RegExp(replacement.target);
      resultCode = resultCode.replaceAllMapped(
        regExp,
        (final match) => replacement.replacement,
      );
    } else {
      resultCode =
          resultCode.replaceAll(replacement.target, replacement.replacement);
    }
  }

  return resultCode;
}

Future<void> moveMergeTargets(final List<MergeTarget> targets) async {
  for (final target in targets) {
    final sourceDir = Directory(target.source);
    final destinationDir = Directory(target.destination);

    if (!await sourceDir.exists()) {
      info('Source directory does not exist: ${target.source}');
      continue;
    }

    if (await destinationDir.exists() &&
        !(await destinationDir.list().isEmpty)) {
      fatalError(
        'Destination directory already exists when not expected to: ${target.destination}',
      );
    }

    try {
      await sourceDir.rename(target.destination);
      info('Moved ${target.source} to ${target.destination}');
    } on FileSystemException catch (e) {
      fatalError(
        'Failed to move ${target.source} to ${target.destination}: $e',
      );
    }
  }
}

Future<void> wrapDartFunctionsInFiles(
  final List<FunctionWrap> functionWraps,
  final List<String> targets,
) async {
  for (final target in targets) {
    final directory = Directory(target);
    if (!await directory.exists()) {
      info('Target directory does not exist: $target');
      continue;
    }

    await for (final entity
        in directory.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        final content = await entity.readAsString();
        final updatedContent = wrapDartFunctions(content, functionWraps);
        await entity.writeAsString(updatedContent);
        info('Processed file: ${entity.path}');
      }
    }
  }
}

String wrapDartFunctions(
  final String source,
  final List<FunctionWrap> functionWraps,
) {
  int findBalancedParentheses(final String code, final int startIndex) {
    var stack = 0;
    for (var index = startIndex; index < code.length; index++) {
      if (code[index] == '(') {
        stack++;
      } else if (code[index] == ')') {
        stack--;
        if (stack == 0) {
          return index;
        }
      }
    }
    return -1;
  }

  var sourceCode = source;

  for (final wrap in functionWraps) {
    final leadingString = wrap.leading;
    final trailingString = wrap.trailing;
    final leadingIgnore = wrap.ignore_leadings;

    final pattern = RegExp(r'\b' + RegExp.escape(wrap.target) + r'\s*\(');
    final matches = pattern.allMatches(sourceCode).toList();

    var offset = 0;
    for (final match in matches) {
      final startIndex = match.start + offset;
      final openParenIndex = match.end + offset - 1;
      final closeParenIndex =
          findBalancedParentheses(sourceCode, openParenIndex);

      if (closeParenIndex != -1) {
        final wrappedCode = leadingString +
            sourceCode.substring(startIndex, closeParenIndex + 1) +
            trailingString;

        final ignoreMatch = leadingIgnore.any(
          (final ignore) =>
              startIndex - ignore.length >= 0 &&
              sourceCode.substring(startIndex - ignore.length, startIndex) ==
                  ignore,
        );

        if (!sourceCode
                .substring(startIndex, closeParenIndex + 1)
                .startsWith(leadingString) &&
            !sourceCode
                .substring(startIndex, closeParenIndex + 1)
                .endsWith(trailingString) &&
            !ignoreMatch) {
          sourceCode = sourceCode.substring(0, startIndex) +
              wrappedCode +
              sourceCode.substring(closeParenIndex + 1);
          offset += leadingString.length + trailingString.length;
        }
      }
    }
  }

  return sourceCode;
}

Future<void> mergeBackTargetsFromTemp(
  final List<MergeTarget> targets,
) async {
  for (final target in targets) {
    final tempTargetPath = path.join(
      (await getTemporaryDirectory()).path,
      'flutterflow_merge',
      target.destination,
    );
    final tempTargetDir = Directory(tempTargetPath);
    final destinationDir = Directory(target.destination);

    if (!await tempTargetDir.exists()) {
      info('Temporary directory does not exist: $tempTargetPath');
      continue;
    }

    await for (final entity
        in tempTargetDir.list(recursive: true, followLinks: false)) {
      final relativePath = path.relative(entity.path, from: tempTargetPath);
      final destinationPath = path.join(destinationDir.path, relativePath);

      if (entity is File) {
        final destinationFile = File(destinationPath);
        await destinationFile.create(recursive: true);
        await entity.copy(destinationFile.path);
        info('Merged file: ${entity.path} -> $destinationPath');
      } else if (entity is Directory) {
        final destinationSubDir = Directory(destinationPath);
        if (!await destinationSubDir.exists()) {
          await destinationSubDir.create(recursive: true);
        }
        info('Merged directory: ${entity.path} -> $destinationPath');
      }
    }
  }
}
