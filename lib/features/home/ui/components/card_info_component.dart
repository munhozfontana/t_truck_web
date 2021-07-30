import 'dart:math';

import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';

class CardInfo extends StatelessWidget {
  final DashBoardEntity dashBoardEntity;
  const CardInfo({
    Key? key,
    required this.dashBoardEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: StylesColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: contentCard(),
          )
        : Expanded(
            flex: 176,
            child: Container(
              decoration: BoxDecoration(
                color: StylesColors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: contentCard(),
            ),
          );
  }

  Padding contentCard() {
    return Padding(
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
                      angle: dashBoardEntity.inverted ? 180 * pi / 180 : 0,
                      child: Container(
                        height: constraints.maxHeight,
                        width: constraints.maxHeight,
                        decoration: BoxDecoration(
                          color: dashBoardEntity.colorIcon.withOpacity(.2),
                          borderRadius:
                              BorderRadius.circular(constraints.maxHeight),
                        ),
                        child: Icon(
                          dashBoardEntity.icon,
                          color: dashBoardEntity.colorIcon,
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
                dashBoardEntity.quantity,
                style: StylesTypography.h48,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                dashBoardEntity.description,
                style: StylesTypography.h18wBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
