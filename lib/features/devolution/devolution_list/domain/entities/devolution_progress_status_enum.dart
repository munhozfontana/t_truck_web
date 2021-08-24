import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum DevolutionProgressStatus { done, notDone, none, inProgress }

class DevolutionProgressStatusUtils {
  static DevolutionProgressStatus descByCod(String cod) {
    return DevolutionProgressStatus.values.firstWhere(
      (element) => element.sto.contains(cod),
    );
  }
}

extension DevolutionProgressStatusDesc on DevolutionProgressStatus {
  String get desc {
    switch (this) {
      case DevolutionProgressStatus.done:
        return 'Concluido';
      case DevolutionProgressStatus.notDone:
        return 'Pendente';
      case DevolutionProgressStatus.inProgress:
        return 'Em Progresso';
      case DevolutionProgressStatus.none:
        return 'Sem Status';
      default:
        return 'Sem Status';
    }
  }

  String get sto {
    switch (this) {
      case DevolutionProgressStatus.done:
        return 'CONCLUIDO';
      case DevolutionProgressStatus.notDone:
        return 'PENDENTE';
      case DevolutionProgressStatus.inProgress:
        return 'PROGRESSO';
      case DevolutionProgressStatus.none:
        return '';
      default:
        return '';
    }
  }
}

// Pendente Progresso Concluido

extension DevolutionProgressStatusColor on DevolutionProgressStatus {
  Color get color {
    switch (this) {
      case DevolutionProgressStatus.done:
        return StylesColors.green;
      case DevolutionProgressStatus.notDone:
        return StylesColors.wellow;
      case DevolutionProgressStatus.inProgress:
        return StylesColors.blue;
      default:
        return StylesColors.wellow;
    }
  }
}

extension DevolutionProgressStatusIcon on DevolutionProgressStatus {
  Icon get icon {
    switch (this) {
      case DevolutionProgressStatus.done:
        return Icon(Icons.check, color: DevolutionProgressStatus.done.color);
      case DevolutionProgressStatus.notDone:
        return Icon(Icons.error, color: DevolutionProgressStatus.notDone.color);
      case DevolutionProgressStatus.inProgress:
        return Icon(Icons.sync,
            color: DevolutionProgressStatus.inProgress.color);
      default:
        return Icon(Icons.info, color: DevolutionProgressStatus.notDone.color);
    }
  }
}

// Pendente Progresso Concluido
