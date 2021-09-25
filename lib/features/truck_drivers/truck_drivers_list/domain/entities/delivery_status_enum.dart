import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum DeliveryStatus { done, inProgess, notDone, none }

DeliveryStatus deliveryDescByCod(String cod) {
  return DeliveryStatus.values.firstWhere(
    (element) => cod.contains(element.sto),
  );
}

extension DeliveryStatusDesc on DeliveryStatus {
  String get desc {
    switch (this) {
      case DeliveryStatus.done:
        return 'Finalizado';
      case DeliveryStatus.notDone:
        return 'Não Iniciado';
      case DeliveryStatus.none:
        return 'Sem Status';
      case DeliveryStatus.inProgess:
        return 'Em progresso';
      default:
        return 'Sem Status';
    }
  }

  String get sto {
    switch (this) {
      case DeliveryStatus.done:
        return 'CONCLUIDO';
      case DeliveryStatus.notDone:
        return 'NAOINICIADO';
      case DeliveryStatus.none:
        return 'INVALIDO';
      case DeliveryStatus.inProgess:
        return 'EMTRANSITO';
      default:
        return 'INVALIDO';
    }
  }
}

extension DeliveryStatusColor on DeliveryStatus {
  Color get color {
    switch (this) {
      case DeliveryStatus.done:
        return StylesColors.green;
      case DeliveryStatus.notDone:
        return StylesColors.wellow;
      case DeliveryStatus.none:
        return StylesColors.black;
      case DeliveryStatus.inProgess:
        return Colors.teal;
      default:
        return Colors.black;
    }
  }
}

extension DeliveryStatusIcon on DeliveryStatus {
  Icon get icon {
    switch (this) {
      case DeliveryStatus.done:
        return Icon(
          Icons.check,
          color: DeliveryStatus.done.color,
        );
      case DeliveryStatus.notDone:
        return Icon(
          Icons.error,
          color: DeliveryStatus.notDone.color,
        );
      case DeliveryStatus.none:
        return Icon(
          Icons.error,
          color: DeliveryStatus.none.color,
        );
      case DeliveryStatus.inProgess:
        return Icon(
          Icons.error,
          color: DeliveryStatus.inProgess.color,
        );
      default:
        return Icon(
          Icons.info,
          color: DeliveryStatus.notDone.color,
        );
    }
  }
}
