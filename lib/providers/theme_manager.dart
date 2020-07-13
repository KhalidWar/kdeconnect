import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  bool _isDark = false;
  SharedPreferences sharedPreferences;
  final String key = 'prefKey';

  bool get isDark => _isDark;

  ThemeManager() {
    _isDark = false;
    _loadTheme();
  }

  toggleTheme() {
    _isDark = !_isDark;
    _saveTheme();
    notifyListeners();
  }

  _initPref() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  _saveTheme() async {
    await _initPref();
    sharedPreferences.setBool(key, _isDark);
  }

  _loadTheme() async {
    await _initPref();
    _isDark = sharedPreferences.getBool(key) ?? false;
    notifyListeners();
  }
}

bool isLightTheme(context) {
  var isLightTheme = Theme.of(context).brightness == Brightness.light;
  return isLightTheme;
}
