import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  final Widget? secondary;
  final int flex;

  const TitleComponent({
    Key? key,
    required this.title,
    this.secondary,
    this.flex = 3,
  }) : super(key: key);

  @override
  Expanded build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              title,
              style: StylesTypography.h24,
            ),
          ),
          Container(
            child: secondary ?? Container(),
          ),
        ],
      ),
    );
  }
}
