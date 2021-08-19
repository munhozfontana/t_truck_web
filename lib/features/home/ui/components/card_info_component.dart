import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/components/responsive.dart';
import '../../../../core/styles/style_colors.dart';
import '../../../../core/styles/styles_fonts.dart';
import '../../domain/entities/dash_board_entity.dart';

class CardInfo extends StatelessWidget {
  final DashBoardEntity? dashBoardEntity;
  const CardInfo({
    Key? key,
    required this.dashBoardEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: StylesColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: contentCard(context),
          )
        : Expanded(
            flex: 176,
            child: Container(
              decoration: BoxDecoration(
                color: StylesColors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: contentCard(context),
            ),
          );
  }

  Padding contentCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (BuildContext _, BoxConstraints constraints) {
                return Row(
                  children: [
                    Transform.rotate(
                      angle: dashBoardEntity!.inverted ? 180 * pi / 180 : 0,
                      child: Container(
                        height: constraints.maxHeight,
                        width: constraints.maxHeight,
                        decoration: BoxDecoration(
                          color: dashBoardEntity!.colorIcon.withOpacity(.2),
                          borderRadius:
                              BorderRadius.circular(constraints.maxHeight),
                        ),
                        child: Visibility(
                          visible: Responsive.isMobile(context),
                          replacement: iconCard(),
                          child: FittedBox(
                            child: iconCard(),
                          ),
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
                      child: Visibility(
                        visible: Responsive.isMobile(context),
                        replacement: iconReload(),
                        child: FittedBox(
                          child: iconReload(),
                        ),
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
              child: titleCard(context),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: Responsive.isMobile(context),
                replacement: descriptionCard(),
                child: FittedBox(
                  child: descriptionCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text descriptionCard() {
    return Text(
      dashBoardEntity!.description,
      style: StylesTypography.h18wBold,
    );
  }

  Text titleCard(BuildContext context) {
    return Text(
      dashBoardEntity!.quantity,
      style: Responsive.when(
        context,
        mobile: StylesTypography.h21,
        orOther: StylesTypography.h48,
      ),
    );
  }

  Icon iconReload() {
    return Icon(
      Icons.refresh,
      color: Colors.black.withOpacity(.2),
    );
  }

  Icon iconCard() {
    return Icon(
      dashBoardEntity!.icon,
      color: dashBoardEntity!.colorIcon,
    );
  }
}
