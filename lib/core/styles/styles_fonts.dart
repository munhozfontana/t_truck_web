import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

class StylesTypography {
  static TextStyle get h48 => TextStyle(
      letterSpacing: 1.1,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 48,
      color: StylesColors.blue);

  static TextStyle get h24 => TextStyle(
      letterSpacing: 1.1,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 24,
      color: StylesColors.blue);

  static TextStyle get h18 => TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: StylesColors.gray);

  static TextStyle get h18wBold => TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: StylesColors.gray);

  static TextStyle get h16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 16,
      );

  static TextStyle get h16W400 => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 16,
      );

  static TextStyle get h14 => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 14,
      );
}
