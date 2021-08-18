import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

enum DeliveryStatus { done, inProgess, notDone, none }

extension DeliveryStatusDesc on DeliveryStatus {
  String get desc {
    switch (this) {
      case DeliveryStatus.done:
        return 'Finalizado';
      case DeliveryStatus.inProgess:
        return 'Em progresso';
      case DeliveryStatus.notDone:
        return 'Não concluido';
      case DeliveryStatus.none:
        return 'Sem Status';
      default:
        return 'Sem Status';
    }
  }
}

extension DeliveryStatusColor on DeliveryStatus {
  Color get color {
    switch (this) {
      case DeliveryStatus.done:
        return StylesColors.green;
      case DeliveryStatus.inProgess:
        return StylesColors.wellow;
      case DeliveryStatus.notDone:
        return StylesColors.orange;
      default:
        return StylesColors.wellow;
    }
  }
}

extension DeliveryStatusIcon on DeliveryStatus {
  Icon get icon {
    switch (this) {
      case DeliveryStatus.done:
        return Icon(Icons.check, color: DeliveryStatus.done.color);
      case DeliveryStatus.notDone:
        return Icon(Icons.error, color: DeliveryStatus.notDone.color);
      case DeliveryStatus.inProgess:
        return Icon(Icons.error, color: DeliveryStatus.inProgess.color);
      default:
        return Icon(Icons.info, color: DeliveryStatus.notDone.color);
    }
  }
}
