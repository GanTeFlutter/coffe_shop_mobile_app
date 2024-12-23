import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/theme/base_theme.dart';
import 'package:coffe_shop_mobile_app/product/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppDarkTheme implements BaseTheme {
  @override
  ThemeData get themeData => ThemeData(
        fontFamily: GoogleFonts.b612().fontFamily,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        scaffoldBackgroundColor: CustomColorScheme.darkColorScheme.surface,
        cardTheme: cardThemeData,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  CardTheme get cardThemeData => const CardTheme(
        color: ApplicationColors.grey,
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData => BottomNavigationBarThemeData(
        backgroundColor: CustomColorScheme.darkColorScheme.secondaryContainer,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      );
}
