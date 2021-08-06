import 'package:flutter/cupertino.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum DevolutionStatus { done, notDone, none }

extension DevolutionStatusDesc on DevolutionStatus {
  String get desc {
    switch (this) {
      case DevolutionStatus.done:
        return 'Devolução Completa';
      case DevolutionStatus.notDone:
        return 'Devolução Imcompleta';
      case DevolutionStatus.none:
        return 'Sem Status';
      default:
        return 'Sem Status';
    }
  }
}

extension DevolutionStatusColor on DevolutionStatus {
  Color get color {
    switch (this) {
      case DevolutionStatus.done:
        return StylesColors.green;
      case DevolutionStatus.notDone:
        return StylesColors.wellow;
      default:
        return StylesColors.wellow;
    }
  }
}
