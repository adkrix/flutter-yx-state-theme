import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yx_state/yx_state.dart';

import 'app_settings.dart';

const _storeSettingsName = 'app_theme';

class SettingsController extends StateManager<AppSettings> {
  SettingsController() : super(AppSettings.fromJson({})) {
    _loadSettings();
  }

  void _loadSettings() => handle((emit) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_storeSettingsName);

    emit(AppSettings.fromString(saved));
  });

  void toggleTheme() => handle((emit) async {
    final newState =       AppSettings(
      theme: state.theme == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
      lang: state.lang,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _storeSettingsName,
      newState.toString(),
    );
    emit(newState);
  });
}
