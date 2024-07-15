import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Helper class for internationalization
class FFLocalizations {
  FFLocalizations(this.locale);

  // Initializing
  // ignore: avoid_unused_constructor_parameters
  FFLocalizations.of(final BuildContext context) : locale = const Locale('en');

  final Locale locale;

  static List<String> languages() => ['en'];

  String get languageCode => locale.languageCode;

  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(final String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    final String? enText = '',
  }) =>
      [enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(final Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(final Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(final FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[]
    .reduce((final a, final b) => a..addAll(b));
