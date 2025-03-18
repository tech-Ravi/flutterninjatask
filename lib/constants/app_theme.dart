import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_desktop_app_task/constants/app_colors.dart';


class AppTheme {
  AppTheme._();

  static ThemeData getTheme(bool isDarkMode) {
    return isDarkMode ? darkTheme : lightTheme;
  }

  /// Light theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.robotoCondensedTextTheme(
      ThemeData.light().textTheme,
    ),
    cardColor: AppColors.appCardBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBackground,
      foregroundColor: AppColors.appText,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.appScaffoldBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.appTextSecondary),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.info),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.appDivider,
      thickness: 1,
    ),
  );

  /// Dark theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.robotoCondensedTextTheme(ThemeData.dark().textTheme),
    cardColor: AppColors.appCardBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBackground,
      foregroundColor: AppColors.appText,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.appScaffoldBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.appTextSecondary),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.info),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.appDivider,
      thickness: 1,
    ),
  );
}
