import 'package:t_truck_web/features/truck_drivers/domain/enum/delivery_status_enum.dart';

class TruckDriversEntity {
  String cod;
  String truckDriver;
  String quantityDelivers;
  DeliveryStatus deliveryStatus;

  TruckDriversEntity({
    required this.cod,
    required this.truckDriver,
    required this.quantityDelivers,
    required this.deliveryStatus,
  });
}
