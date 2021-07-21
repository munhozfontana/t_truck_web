import 'dart:math';

import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class CardInfo extends StatelessWidget {
  final IconData icon;
  final String quantity;
  final String description;
  final Color colorIcon;
  final bool inverted;

  const CardInfo({
    Key? key,
    this.icon = Icons.flutter_dash_outlined,
    this.quantity = '000',
    this.description = 'Sem informação',
    this.colorIcon = Colors.red,
    this.inverted = false,
  }) : super(key: key);

  @override
  Expanded build(BuildContext context) {
    return Expanded(
      flex: 176,
      child: Container(
        decoration: BoxDecoration(
          color: StylesColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      children: [
                        Transform.rotate(
                          angle: inverted ? 180 * pi / 180 : 0,
                          child: Container(
                            height: constraints.maxHeight,
                            width: constraints.maxHeight,
                            decoration: BoxDecoration(
                              color: colorIcon.withOpacity(.2),
                              borderRadius:
                                  BorderRadius.circular(constraints.maxHeight),
                            ),
                            child: Icon(
                              icon,
                              color: colorIcon,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: constraints.maxHeight,
                          width: constraints.maxHeight,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(constraints.maxHeight),
                          ),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.black.withOpacity(.2),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    quantity,
                    style: StylesTypography.h48,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description,
                    style: StylesTypography.h18wBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
