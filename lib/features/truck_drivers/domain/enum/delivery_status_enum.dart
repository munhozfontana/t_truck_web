import 'package:flutter/cupertino.dart';

import '../../../../core/styles/style_colors.dart';

enum DeliveryStatus { done, inProgess, notDone }

extension DeliveryStatusDesc on DeliveryStatus {
  String get desc {
    switch (this) {
      case DeliveryStatus.done:
        return 'Finalizado';
      case DeliveryStatus.inProgess:
        return 'Em progresso';
      case DeliveryStatus.notDone:
        return 'Não concluido';
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
