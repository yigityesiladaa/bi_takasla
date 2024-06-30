import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:bitakasla/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
  ),

  primaryTextTheme: TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 34.0.dpx,
      letterSpacing: -1.5,
      color: AppColors.darkGray,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 25.0.dpx,
      letterSpacing: -0.5,
      color: AppColors.darkGray,
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 18.5.dpx,
      color: AppColors.darkGray,
    ),
    headlineMedium: GoogleFonts.manrope(
      fontSize: 21.5.dpx,
      letterSpacing: 0.25,
      color: AppColors.darkGray,
    ),
    headlineSmall: GoogleFonts.manrope(
      fontSize: 18.0.dpx,
      color: AppColors.darkGray,
    ),
    titleLarge: GoogleFonts.manrope(
      fontSize: 18.0.dpx,
      letterSpacing: 0.25,
      color: AppColors.darkGray,
    ),
    titleMedium: GoogleFonts.manrope(
      fontSize: 16.0.dpx,
      letterSpacing: 0.25,
      color: AppColors.darkGray,
    ),
    titleSmall: GoogleFonts.manrope(
      fontSize: 14.0.dpx,
      letterSpacing: 0.5,
      color: AppColors.darkGray,
    ),
    bodyLarge: GoogleFonts.manrope(
      fontSize: 14.0.dpx,
      letterSpacing: 0.5,
      color: AppColors.darkGray,
    ),
    bodyMedium: GoogleFonts.manrope(
      fontSize: 12.0.dpx,
      letterSpacing: 0.4,
      color: AppColors.darkGray,
    ),
    bodySmall: GoogleFonts.manrope(
      fontSize: 10.0.dpx,
      letterSpacing: 0.4,
      color: AppColors.darkGray,
    ),
    labelLarge: GoogleFonts.manrope(
      fontSize: 11.0.dpx,
      letterSpacing: 1,
      color: AppColors.darkGray,
    ),
    labelMedium: GoogleFonts.manrope(
      fontSize: 10.0.dpx,
      letterSpacing: 1,
      color: AppColors.darkGray,
    ),
    labelSmall: GoogleFonts.manrope(
      fontSize: 9.0.dpx,
      letterSpacing: 0.8,
      color: AppColors.darkGray,
    ),
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  brightness: Brightness.dark,
  cardColor: AppColors.cardColor,
  indicatorColor: AppColors.primaryColor,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  dividerColor: AppColors.dividerColor,
  iconTheme: IconThemeData(
    size: 20.px,
    color: AppColors.primaryColor,
  ),
  primaryIconTheme: IconThemeData(
    size: 20.px,
    color: AppColors.primaryColor,
  ),
  cardTheme: CardTheme(
    color: AppColors.cardColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12,
      ),
    ),
    margin: EdgeInsets.zero,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.grey1000Color,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.grey600Color,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.grey1000Color,
    elevation: 4,
  ),
  primaryTextTheme: TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 34.0.dpx,
      letterSpacing: -1.5,
      color: AppColors.whiteColor,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 25.0.dpx,
      letterSpacing: -0.5,
      color: AppColors.whiteColor,
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 18.5.dpx,
      color: AppColors.whiteColor,
    ),
    headlineMedium: GoogleFonts.manrope(
      fontSize: 21.5.dpx,
      letterSpacing: 0.25,
      color: AppColors.whiteColor,
    ),
    headlineSmall: GoogleFonts.manrope(
      fontSize: 18.0.dpx,
      color: AppColors.whiteColor,
    ),
    titleLarge: GoogleFonts.manrope(
      fontSize: 18.0.dpx,
      letterSpacing: 0.25,
      color: AppColors.whiteColor,
    ),
    titleMedium: GoogleFonts.manrope(
      fontSize: 16.0.dpx,
      letterSpacing: 0.25,
      color: AppColors.whiteColor,
    ),
    titleSmall: GoogleFonts.manrope(
      fontSize: 14.0.dpx,
      letterSpacing: 0.5,
      color: AppColors.whiteColor,
    ),
    bodyLarge: GoogleFonts.manrope(
      fontSize: 14.0.dpx,
      letterSpacing: 0.5,
      color: AppColors.whiteColor,
    ),
    bodyMedium: GoogleFonts.manrope(
      fontSize: 12.0.dpx,
      letterSpacing: 0.4,
      color: AppColors.whiteColor,
    ),
    bodySmall: GoogleFonts.manrope(
      fontSize: 10.0.dpx,
      letterSpacing: 0.4,
      color: AppColors.whiteColor,
    ),
    labelLarge: GoogleFonts.manrope(
      fontSize: 11.0.dpx,
      letterSpacing: 1,
      color: AppColors.whiteColor,
    ),
    labelMedium: GoogleFonts.manrope(
      fontSize: 10.0.dpx,
      letterSpacing: 1,
      color: AppColors.whiteColor,
    ),
    labelSmall: GoogleFonts.manrope(
      fontSize: 9.0.dpx,
      letterSpacing: 0.8,
      color: AppColors.whiteColor,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.grey800Color,
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(brightness: Brightness.dark)
      .copyWith(surface: AppColors.backgroundColor),
);