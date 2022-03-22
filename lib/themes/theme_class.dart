import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';

class ThemeClass {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: backgroundColor2,
    backgroundColor: backgroundColor2,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor1,
    ),
    primaryColor: primaryColor,
  );

  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: darkBackgroundColor2,
    backgroundColor: darkBackgroundColor2,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkBackgroundColor3,
    ),
    primaryColor: primaryColor,
  );
}
