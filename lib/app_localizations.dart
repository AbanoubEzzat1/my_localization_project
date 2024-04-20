import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// AppLocalizations file
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Map<String, dynamic>? _localizedStrings;

  static Future<AppLocalizations> load(Locale locale) async {
    String jsonContent =
        await rootBundle.loadString('assets/${locale.languageCode}.json');
    _localizedStrings = json.decode(jsonContent);
    return AppLocalizations(locale);
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String translate(String key) {
    return _localizedStrings?[key] ?? '';
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
