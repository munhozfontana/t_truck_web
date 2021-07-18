import 'package:flutter/material.dart';

import '../styles/styles_fonts.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  final Widget? secondary;
  final int flex;

  const TitleComponent({
    Key? key,
    required this.title,
    this.secondary,
    this.flex = 2,
  }) : super(key: key);

  @override
  Expanded build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: StylesTypography.h24,
          ),
          Container(
            child: secondary ?? Container(),
          ),
        ],
      ),
    );
  }
}