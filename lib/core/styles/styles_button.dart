import 'package:flutter/material.dart';

import 'style_colors.dart';

class StylesButton {
  static ButtonStyle get defaultButton => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(StylesColors.blue),
      );
}
