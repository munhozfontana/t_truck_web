import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum MessageEntityEnum { solve, notSolve, none }

extension MessageEntityEnumDesc on MessageEntityEnum {
  String get desc {
    switch (this) {
      case MessageEntityEnum.solve:
        return 'Finalizado';
      case MessageEntityEnum.notSolve:
        return 'Em progresso';
      case MessageEntityEnum.none:
        return 'Sem EntityEnum';
      default:
        return 'Sem EntityEnum';
    }
  }
}

extension MessageEntityEnumColor on MessageEntityEnum {
  Color get color {
    switch (this) {
      case MessageEntityEnum.solve:
        return StylesColors.green;
      case MessageEntityEnum.notSolve:
        return StylesColors.wellow;
      default:
        return StylesColors.wellow;
    }
  }
}

extension MessageEntityEnumIcon on MessageEntityEnum {
  Icon get icon {
    switch (this) {
      case MessageEntityEnum.solve:
        return Icon(Icons.check, color: MessageEntityEnum.solve.color);
      case MessageEntityEnum.notSolve:
        return Icon(Icons.error, color: MessageEntityEnum.notSolve.color);
      default:
        return Icon(Icons.info, color: MessageEntityEnum.notSolve.color);
    }
  }
}
