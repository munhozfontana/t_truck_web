import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum SupportEntityEnum { solve, notSolve, none }

extension SupportEntityEnumDesc on SupportEntityEnum {
  String get desc {
    switch (this) {
      case SupportEntityEnum.solve:
        return 'Finalizado';
      case SupportEntityEnum.notSolve:
        return 'Em progresso';
      case SupportEntityEnum.none:
        return 'Sem EntityEnum';
      default:
        return 'Sem EntityEnum';
    }
  }
}

extension SupportEntityEnumColor on SupportEntityEnum {
  Color get color {
    switch (this) {
      case SupportEntityEnum.solve:
        return StylesColors.green;
      case SupportEntityEnum.notSolve:
        return StylesColors.wellow;
      default:
        return StylesColors.wellow;
    }
  }
}

extension SupportEntityEnumIcon on SupportEntityEnum {
  Icon get icon {
    switch (this) {
      case SupportEntityEnum.solve:
        return Icon(Icons.check, color: SupportEntityEnum.solve.color);
      case SupportEntityEnum.notSolve:
        return Icon(Icons.error, color: SupportEntityEnum.notSolve.color);
      default:
        return Icon(Icons.info, color: SupportEntityEnum.notSolve.color);
    }
  }
}
