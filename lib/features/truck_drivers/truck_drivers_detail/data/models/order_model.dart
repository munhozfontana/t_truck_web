import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required int numOrder,
    required String clientName,
    required int quantity,
    required DeliveryStatus status,
  }) : super(
          numOrder: numOrder,
          clientName: clientName,
          quantity: quantity,
          status: status,
        );

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      numOrder: map['CODCLI'] as int,
      clientName: map['CLIENTE'] as String,
      quantity: map['QTDE'] as int,
      status: DeliveryStatus.none,
    );
  }
}
