// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  final ThemeHive _hivetheme = ThemeHive();
  bool get isDark => _isDark;

  ThemeModel() {
    getPreferences();
  }
  set isDark(bool value) {
    _isDark = value;
    _hivetheme.setTheme(value);
    notifyListeners();
  }

  Future<void> getPreferences() async {
    _isDark = await _hivetheme.getTheme();
    notifyListeners();
  }
}

class ThemeHive {
  static const THEME_KEY = 'theme_key';
  static const IS_DARK = 'dark';

  Future<void> setTheme(bool value) async {
    final box = await Hive.openBox<bool>(THEME_KEY);
    await box.put(IS_DARK, value);
  }

  Future<bool> getTheme() async {
    final box = await Hive.openBox<bool>(THEME_KEY);
    return box.get(IS_DARK) ?? false;
  }
}
