import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          size: 30,
          color: AppColors.blackColor,
        ),
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        shadowColor: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      backgroundColor: AppColors.PrimaryColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.PrimaryColor,
      thickness: 3,
    ),
    iconTheme: IconThemeData(
      color: AppColors.PrimaryColor,
      size: 25,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor),
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.blackColor),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.PrimaryColor,
        onPrimary: AppColors.PrimaryColor,
        secondary: AppColors.PrimaryColor,
        onSecondary: AppColors.PrimaryColor,
        error: AppColors.PrimaryColor,
        onError: AppColors.PrimaryColor,
        surface: AppColors.PrimaryColor,
        onSurface: AppColors.PrimaryColor
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          size: 30,
          color: Colors.white,
        ),
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        shadowColor: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.YellowColor,
      backgroundColor: AppColors.PrimaryColorDark,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.PrimaryColor,
      thickness: 3,
    ),
    iconTheme: IconThemeData(
      color: AppColors.YellowColor,
      size: 25,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.YellowColor),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.PrimaryColor,
        onPrimary: AppColors.PrimaryColor,
        secondary: AppColors.PrimaryColor,
        onSecondary: AppColors.PrimaryColor,
        error: AppColors.PrimaryColor,
        onError: AppColors.PrimaryColor,
        surface: AppColors.PrimaryColor,
        onSurface: AppColors.PrimaryColor
    ),
  );
}
