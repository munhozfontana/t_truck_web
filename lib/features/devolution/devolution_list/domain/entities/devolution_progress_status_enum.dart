import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum DevolutionProgressStatus { done, notDone, inProgress, processing }

DevolutionProgressStatus devolutionProgressDescByCod(String cod) {
  final result = DevolutionProgressStatus.values.firstWhere(
    (element) {
      return cod.contains(element.sto);
    },
  );
  return result;
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
      case DevolutionProgressStatus.processing:
        return 'Em processamento';
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
      case DevolutionProgressStatus.processing:
        return 'PROCESSAMENTO';
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
      case DevolutionProgressStatus.processing:
        return Colors.teal;
      default:
        return Colors.black;
    }
  }
}

extension DevolutionProgressStatusIcon on DevolutionProgressStatus {
  Icon get icon {
    switch (this) {
      case DevolutionProgressStatus.done:
        return Icon(
          Icons.check,
          color: DevolutionProgressStatus.done.color,
        );
      case DevolutionProgressStatus.notDone:
        return Icon(
          Icons.error,
          color: DevolutionProgressStatus.notDone.color,
        );
      case DevolutionProgressStatus.inProgress:
        return Icon(
          Icons.sync,
          color: DevolutionProgressStatus.inProgress.color,
        );
      case DevolutionProgressStatus.processing:
        return Icon(
          Icons.engineering_outlined,
          color: DevolutionProgressStatus.inProgress.color,
        );
      default:
        return Icon(
          Icons.info,
          color: DevolutionProgressStatus.notDone.color,
        );
    }
  }
}
