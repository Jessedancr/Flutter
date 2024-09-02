import 'package:flutter/material.dart';

import 'light_mode.dart';
import 'dark_mode.dart';

/**
 * THEME PROVIDER
 * TO HELP CHANGE THE APP FROM LIGHT TO DARK MODE
 */
class ThemeProvider extends ChangeNotifier {
  // Initially set theme to light mode
  ThemeData _themeData = lightMode;

  // Getter func to get the current theme of app
  ThemeData get themeData => _themeData;

  // Boolean getter func to check if its currently darkmode
  // Returns true if in darkMode, false otherwise
  bool get isDarkMode => _themeData == darkMode;

  // Set the theme
  // @param themeData, the new theme to set
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Function to toggle btw light and darkmode
  void changeTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
