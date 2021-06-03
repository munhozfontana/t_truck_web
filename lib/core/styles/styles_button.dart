import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

class StylesButton {
  static ButtonStyle get defaultButton => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(StylesColors.blue),
      );
}
