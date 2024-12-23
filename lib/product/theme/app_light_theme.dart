import 'package:coffe_shop_mobile_app/product/theme/base_theme.dart';
import 'package:coffe_shop_mobile_app/product/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppLightTheme implements BaseTheme {
  @override
  ThemeData get themeData => ThemeData(
        fontFamily: GoogleFonts.b612().fontFamily,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        scaffoldBackgroundColor: CustomColorScheme.lightColorScheme.surface,
        cardTheme: cardThemeData,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  CardTheme get cardThemeData => const CardTheme(
        color: Colors.white,
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      );
}
