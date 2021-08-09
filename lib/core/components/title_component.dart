import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/responsive.dart';

import '../styles/styles_fonts.dart';

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
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          primary ??
              Text(
                title!,
                style: Responsive.whenWidgetDy(
                  context,
                  desktop: StylesTypography.h24,
                  mobile: StylesTypography.h24,
                  tablet: StylesTypography.h24,
                ) as TextStyle,
              ),
          Visibility(
            visible: secondary != null,
            replacement: Container(),
            child: secondary ?? Container(),
          )
        ],
      ),
    );
  }
}
