import 'package:bitakasla/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class CustomColorSheme {
  final Color primaryColor;
  final Color instrumentCardColor;
  final Color boxColor;
  final Color darkGreyToLightGrey;
  final Color lightGreyToDarkGrey;

  final Color whiteToBlack;
  CustomColorSheme({
    required this.primaryColor,
    required this.instrumentCardColor,
    required this.boxColor,
    required this.darkGreyToLightGrey,
    required this.lightGreyToDarkGrey,
    required this.whiteToBlack,
  });
}

class LightColorSheme extends CustomColorSheme {
  LightColorSheme()
      : super(
          primaryColor: AppColors.yellowOrange,
          boxColor: AppColors.cardColor,
          instrumentCardColor: AppColors.cardColor, //cardcolor
          darkGreyToLightGrey: AppColors.darkGray, //textcolor3
          lightGreyToDarkGrey: AppColors.lightGray, //textcolor2
          whiteToBlack: AppColors.black, //textcolor 1
        );
}

class DarkColorSheme extends CustomColorSheme {
  DarkColorSheme()
      : super(
          primaryColor: AppColors.dodgerBlue,
          boxColor: AppColors.mirage,
          instrumentCardColor: AppColors.mirage, //cardcolor
          darkGreyToLightGrey: AppColors.lightGray, //textcolor3
          lightGreyToDarkGrey: AppColors.darkGray, //textcolor2
          whiteToBlack: AppColors.wildSand, //textcolor 1
        );
}

class CustomTheme {
  final CustomColorSheme colorSheme;

  CustomTheme._(this.colorSheme);

  factory CustomTheme.dark() {
    return CustomTheme._(DarkColorSheme());
  }

  factory CustomTheme.light() {
    return CustomTheme._(LightColorSheme());
  }
}