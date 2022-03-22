import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    setDarkMode(value);
    notifyListeners();
  }

  setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  Future<bool> getMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode') ?? false;
  }
}
