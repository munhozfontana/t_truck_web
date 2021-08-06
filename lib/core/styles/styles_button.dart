import 'package:flutter/material.dart';

import 'style_colors.dart';

mixin StylesButton {
  static ButtonStyle get defaultButton => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(StylesColors.blue),
      );
  static ButtonStyle get grayButton => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          StylesColors.grayWhitePlus,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34.0),
          ),
        ),
      );
}
