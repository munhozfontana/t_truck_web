import 'enum/delivery_status_enum.dart';

class TruckDriversEntity {
  String cod;
  String truckDriver;
  String quantityDelivers;
  DeliveryStatus status;

  TruckDriversEntity({
    required this.cod,
    required this.truckDriver,
    required this.quantityDelivers,
    required this.status,
  });
}
