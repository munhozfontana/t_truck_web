import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';

class OrderEntity {
  final int numOrder;
  final String clientName;
  final int nf;
  final DeliveryStatus status;

  OrderEntity({
    required this.numOrder,
    this.clientName = '',
    required this.nf,
    this.status = DeliveryStatus.none,
  });
}
