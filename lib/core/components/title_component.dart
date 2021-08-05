import 'package:flutter/material.dart';

import '../styles/styles_fonts.dart';
import 'responsive.dart';

class TitleComponent extends StatelessWidget {
  final String? title;
  final Widget? primary;
  final Widget? secondary;
  final int flex;

  const TitleComponent({
    Key? key,
    this.title = '',
    this.primary,
    this.secondary,
    this.flex = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Responsive.isNotMobile(context),
      child: Expanded(
        flex: flex,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            primary ??
                Text(
                  title!,
                  style: StylesTypography.h24,
                ),
            Container(
              child: secondary ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}
