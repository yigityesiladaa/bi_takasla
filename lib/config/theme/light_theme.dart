import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.cardBlueColor,
    selectionHandleColor: AppColors.cardBlueColor,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundColor,
    iconTheme: IconThemeData(color: AppColors.black),
    actionsIconTheme: IconThemeData(color: AppColors.black),
  ),
  iconTheme: IconThemeData(
    size: 16.px,
    color: AppColors.black,
  ),
  primaryIconTheme: IconThemeData(
    size: 16.px,
    color: AppColors.black,
  ),
  primaryColor: AppColors.yellowOrange,
  cardTheme: CardTheme(
    color: AppColors.cardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        4,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.cardColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    elevation: 4,
  ),
  primaryTextTheme: TextTheme(
    displayLarge: GoogleFonts.openSans(
      fontSize: 35.5.dpx,
      letterSpacing: -1.5,
      color: AppColors.black,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 48.5.dpx,
      letterSpacing: -0.5,
      color: AppColors.black,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 38.5.dpx,
      color: AppColors.black,
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 28.0.dpx,
      letterSpacing: 0.25,
      color: AppColors.black,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 19.5.dpx,
      color: AppColors.black,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 16.5.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 15.0.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 14.0.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 13.5.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 12.0.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 10.0.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    labelLarge: GoogleFonts.openSans(
      fontSize: 11.0.dpx,
      letterSpacing: 1.25,
      color: AppColors.black,
    ),
    labelMedium: GoogleFonts.openSans(
      fontSize: 9.5.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
    labelSmall: GoogleFonts.openSans(
      fontSize: 8.0.dpx,
      letterSpacing: 0,
      color: AppColors.black,
    ),
  ),
);