import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum DevolutionStatus { done, notDone, none }

DevolutionStatus devolutionDescByCod(String cod) {
  return DevolutionStatus.values.firstWhere(
    (element) => cod.contains(element.sto),
  );
}

extension DevolutionStatusDesc on DevolutionStatus {
  String get desc {
    switch (this) {
      case DevolutionStatus.done:
        return 'Devolução Total da NF';
      case DevolutionStatus.notDone:
        return 'Devolução Parcial da NF';
      case DevolutionStatus.none:
        return 'Sem Status';
      default:
        return 'Sem Status';
    }
  }

  String get sto {
    switch (this) {
      case DevolutionStatus.done:
        return 'DEVT';
      case DevolutionStatus.notDone:
        return 'DEVP';
      case DevolutionStatus.none:
        return '';
      default:
        return '';
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

extension DevolutionStatusIcon on DevolutionStatus {
  Icon get icon {
    switch (this) {
      case DevolutionStatus.done:
        return Icon(Icons.check, color: DevolutionStatus.done.color);
      case DevolutionStatus.notDone:
        return Icon(Icons.error, color: DevolutionStatus.notDone.color);
      default:
        return Icon(Icons.info, color: DevolutionStatus.notDone.color);
    }
  }
}
