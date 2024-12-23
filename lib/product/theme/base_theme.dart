import 'package:flutter/material.dart';

abstract class BaseTheme {
  ThemeData get themeData;
  FloatingActionButtonThemeData get floatingActionButtonThemeData;
  CardTheme get cardThemeData;
  BottomNavigationBarThemeData get bottomNavigationBarThemeData;

  // ElevatedButtonThemeData get elevatedButtonThemeData;
  // TextTheme get textButtonThemeData;
  // BottomNavigationBarThemeData get bottomNavigationBarThemeData;
  // AppBarTheme get appBarThemeData;
}
