// ignore_for_file: avoid_print

import 'dart:io';

void fatalError(final String message) {
  print(message);
  exit(1);
}

void info(final String message) {
  print(message);
}

bool isIgnored(final String path, final List<String> ignoredItems) {
  for (final ignoredItem in ignoredItems) {
    if (path == ignoredItem ||
        path.startsWith(ignoredItem + Platform.pathSeparator)) {
      return true;
    }
  }
  return false;
}
