import 'package:flutter/material.dart';

import 'style_colors.dart';
import 'styles_fonts.dart';

class StylesInputs {
  static InputDecorationTheme defaultInput() => InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: StylesTypography.h16,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StylesColors.grayWhite),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff090f31)),
          borderRadius: BorderRadius.circular(4.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4.0),
        ),
      );
}
