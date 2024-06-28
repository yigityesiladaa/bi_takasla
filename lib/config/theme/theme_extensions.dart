import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get regular => _createFontWeight(this, FontWeight.w400);
  TextStyle get medium => _createFontWeight(this, FontWeight.w500);
  TextStyle get semibold => _createFontWeight(this, FontWeight.w600);
  TextStyle get bold => _createFontWeight(this, FontWeight.w700);

  TextStyle customFontWeight(FontWeight fontWeight) =>
      _createFontWeight(this, fontWeight);
}

TextStyle _createFontWeight(TextStyle textStyle, FontWeight fontWeight) {
  return GoogleFonts.openSans(
    textStyle: textStyle,
    fontWeight: fontWeight,
  );
}