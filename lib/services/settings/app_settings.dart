import 'dart:convert';

import 'package:flutter/material.dart';

Set<String> appLangs = <String>{'en', 'ru'};

class AppSettings {
  final ThemeMode theme;
  final String lang;
  AppSettings({required this.theme, required this.lang});

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      theme: json['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light,
      lang: appLangs.contains(json['lang']) ? json['lang'] : appLangs.first,
    );
  }

  factory AppSettings.fromString(String? source) {
    Map<String, dynamic> json = jsonDecode(source ?? '{}');
    return AppSettings.fromJson(json);
  }

  @override
  String toString() {
    Map<String, dynamic> json = {
      'theme': theme == ThemeMode.dark ? 'dark' : 'light',
      'lang': lang,
    };
    return jsonEncode(json);
  }
}
