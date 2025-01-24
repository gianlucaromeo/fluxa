import 'package:flutter/material.dart';
import 'package:fluxa/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

get textTheme => GoogleFonts.interTextTheme();

class AppPadding {
  static get scaffoldPadding => [24.0, 24.0, 24.0, 0.0].fromLTRB;
}

class AppColors {
  static const primary = Color(0xFF916CFF); // Purple
  static const onPrimary = Color(0xFF212121); // Black
  static const background = Color(0xFF212121); // Black
  static const surface = Color(0xFF313131); // Dark Grey / Black
  static const border = Color(0xFFA5A5A5); // Light Grey
}

TextStyle _ts(FontWeight fontWeight, double fontSize, [double? letterSpacing]) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    letterSpacing: letterSpacing ?? 0.0,
  );
}

class AppLargeFonts {
  static get _extraBold => FontWeight.w900;
  static get _bold => FontWeight.w700;
  static get _semiBold => FontWeight.w600;
  static get _medium => FontWeight.w500;
  static get _regular => FontWeight.w400;

  static double get smallestFontSize => 8.0;

  static TextStyle get h1 => _ts(_extraBold, 24.0);
  static TextStyle get h2 => _ts(_extraBold, 18.0);
  static TextStyle get h3 => _ts(_extraBold, 16.0);
  static TextStyle get h4 => _ts(_bold, 14.0);
  static TextStyle get h5 => _ts(_bold, 12.0);

  static TextStyle get bodyXL => _ts(_regular, 18.0);
  static TextStyle get bodyL => _ts(_regular, 16.0);
  static TextStyle get bodyM => _ts(_regular, 14.0);
  static TextStyle get bodyS => _ts(_regular, 12.0);
  static TextStyle get bodyXS => _ts(_medium, 10.0);
  static TextStyle get actionL => _ts(_semiBold, 14.0);
  static TextStyle get actionM => _ts(_semiBold, 12.0);
  static TextStyle get actionS => _ts(_semiBold, 10.0);
  static TextStyle get captionM => _ts(_semiBold, 10.0);
}
