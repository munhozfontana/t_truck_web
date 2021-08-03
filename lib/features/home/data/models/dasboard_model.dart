import 'package:flutter/cupertino.dart';

import '../../domain/entities/dash_board_entity.dart';

class DashBoardModel extends DashBoardEntity {
  DashBoardModel({
    required IconData icon,
    required String quantity,
    required String description,
    required Color colorIcon,
    required bool inverted,
  }) : super(
          icon: icon,
          quantity: quantity,
          description: description,
          colorIcon: colorIcon,
          inverted: inverted,
        );
}
