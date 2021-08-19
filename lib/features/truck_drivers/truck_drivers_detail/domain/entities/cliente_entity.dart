import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';

class ClienteEntity {
  final int numOrder;
  final String clientName;
  final int nf;
  final DeliveryStatus status;

  ClienteEntity({
    required this.numOrder,
    this.clientName = '',
    required this.nf,
    this.status = DeliveryStatus.none,
  });
}
