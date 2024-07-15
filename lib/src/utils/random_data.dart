import 'dart:math';
import 'package:flutter/material.dart';

final _random = Random();

int randomInteger(final int min, final int max) =>
    _random.nextInt(max - min + 1) + min;

double randomDouble(final double min, final double max) =>
    _random.nextDouble() * (max - min) + min;

String randomString(
  final int minLength,
  final int maxLength,
  final bool lowercaseAz,
  final bool uppercaseAz,
  final bool digits,
) {
  var chars = '';
  if (lowercaseAz) {
    chars += 'abcdefghijklmnopqrstuvwxyz';
  }
  if (uppercaseAz) {
    chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  }
  if (digits) {
    chars += '0123456789';
  }
  return List.generate(
    randomInteger(minLength, maxLength),
    (final index) => chars[_random.nextInt(chars.length)],
  ).join();
}

// Random date between 1970 and 2025.
// Random max must be in range 0 < max <= 2^32.
// So we have to generate the time in seconds and then convert to milliseconds.
DateTime randomDate() => DateTime.fromMillisecondsSinceEpoch(
      randomInteger(0, 1735689600) * 1000,
    );

String randomImageUrl(final int width, final int height) =>
    'https://picsum.photos/seed/${_random.nextInt(1000)}/$width/$height';

Color randomColor() => Color.fromARGB(
      255,
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
    );
