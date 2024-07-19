// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart' as path;
import './structures.dart';
import './utils.dart';

Future<void> removeItems(
  final String destFolder,
  final Directory rootDir,
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
        entity.path.replaceFirst(rootDir.path + Platform.pathSeparator, '');
    if (removeIgnoredOrEverythingElse
        ? isIgnored(relativePath, ignoredItems)
        : !isIgnored(relativePath, ignoredItems)) {
      try {
        if (entity is File) {
          // info('Deleting file: ${entity.path}');
          await entity.delete();
        }
      } on FileSystemException catch (e) {
        info('Failed to delete ${entity.path}: $e');
      }
    }
  }
}

Future<void> moveTargetsToTempFolder(final List<String> targets) async {
  // Get the temporary directory path
  final tempDir = path.join(Directory.systemTemp.path, 'flutterflow_merge');

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
    final targetDir = Directory(
      path.join(Directory.current.path, target),
    );
    final tempTarget = Directory(path.join(tempDir, target));

    // Ensure the target directory exists before moving
    if (!await targetDir.exists()) {
      fatalError('Target directory does not exist: ${targetDir.path}');
      return;
    }

    // Ensure the target directory exists before moving
    if (await tempTarget.exists()) {
      info('Removing existing temp directory ${tempTarget.path}...');
      await tempTarget.delete();
    }

    // Make the parent dir
    await tempTarget.parent.create(recursive: true);

    info('Moving ${targetDir.path} to ${tempTarget.path}...');
    try {
      await targetDir.rename(tempTarget.path);
    } on FileSystemException catch (e) {
      fatalError('Failed to move ${targetDir.path} to ${tempTarget.path}: $e');
    }
    info('${targetDir.path} moved to ${tempTarget.path} successfully.');
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

Future<void> formatAllFiles(final List<String> directories) async {
  for (final directory in directories) {
    // Construct the arguments for the dart format command
    final args = ['format', directory];

    // Execute the dart format command
    final formatResult = await Process.run('dart', args);
    if (formatResult.exitCode != 0) {
      fatalError('Failed to format Dart files: ${formatResult.stderr}');
    }
  }

  info('Dart files formatted successfully!');
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
      final regExp = RegExp(replacement.target, multiLine: true);
      resultCode = resultCode.replaceAllMapped(
        regExp,
        (final match) => replacement.replacement,
      );
    } else {
      resultCode = resultCode.replaceAll(
        RegExp.escape(replacement.target),
        replacement.replacement,
      );
    }
  }

  return resultCode;
}

Future<void> moveMergeTargets(final List<MergeTarget> targets) async {
  for (final target in targets) {
    final sourceDir =
        Directory(path.join(Directory.current.path, target.source));
    final destinationDir =
        Directory(path.join(Directory.current.path, target.destination));

    if (!await sourceDir.exists()) {
      info('Source directory does not exist: ${sourceDir.path}');
      continue;
    }

    // Move the source dir to a temporary location to avoid the folder into it's own subfolder move problem
    final tempDir =
        path.join(Directory.systemTemp.path, 'flutterflow_merge_temp_mover');
    final tempSourceDir = Directory(path.join(tempDir, target.source));
    if (await tempSourceDir.exists()) {
      info('Removing existing temp source directory ${tempSourceDir.path}...');
      await tempSourceDir.delete(recursive: true);
    }

    // Create the parent of the temp source dir
    await tempSourceDir.parent.create(recursive: true);

    // Move the source dir to the temp source dir
    await sourceDir.rename(tempSourceDir.path);

    // Create the parent of the destination dir
    if (await destinationDir.exists()) {
      if (!(await destinationDir.list().isEmpty)) {
        fatalError(
          'Destination directory already exists and is not empty: ${destinationDir.path}',
        );
      } else {
        info(
          'Destination directory already exists but is empty: ${destinationDir.path}',
        );
      }
    } else {
      await destinationDir.parent.create(recursive: true);
    }

    try {
      await tempSourceDir.rename(destinationDir.path);
      info('Moved ${tempSourceDir.path} to ${destinationDir.path}');
    } on FileSystemException catch (e) {
      fatalError(
        'Failed to move ${tempSourceDir.path} to ${destinationDir.path}: $e',
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
        // info('Processed file: ${entity.path}');
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
      Directory.systemTemp.path,
      'flutterflow_merge',
      target.source,
    );
    final tempTargetDir = Directory(tempTargetPath);
    final destinationDir = Directory(target.source);

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
        // info('Merged file: ${entity.path} -> $destinationPath');
      } else if (entity is Directory) {
        final destinationSubDir = Directory(destinationPath);
        if (!await destinationSubDir.exists()) {
          await destinationSubDir.create(recursive: true);
        }
        // info('Merged directory: ${entity.path} -> $destinationPath');
      }
    }
  }
}
