import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yx_state/yx_state.dart';

const storeName = 'app_theme';

class ThemeController extends StateManager<ThemeMode> {
  ThemeController() : super(ThemeMode.light) {
    _loadSettings();
  }

  void _loadSettings() => handle((emit) async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(storeName);
    emit(savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light);
  });

  void toggleTheme() => handle((emit) async {
    final newState = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      storeName,
      newState == ThemeMode.dark ? 'dark' : 'light',
    );
    emit(newState);
  });
}
