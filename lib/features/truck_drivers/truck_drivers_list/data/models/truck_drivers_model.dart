import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

class TruckDriversModel extends TruckDriversEntity {
  TruckDriversModel({
    required String cod,
    required String truckDriver,
    required String quantityDelivers,
    required DeliveryStatus status,
  }) : super(
          cod: cod,
          truckDriver: truckDriver,
          quantityDelivers: quantityDelivers,
          status: status,
        );

  factory TruckDriversModel.fromMap(Map<String, dynamic> map) {
    return TruckDriversModel(
        cod: (map['CODMOTORISTA'] as int).toString(),
        truckDriver: (map['NOME'] as String).toString(),
        quantityDelivers: (map['ENTREGAS'] as int).toString(),
        status: DeliveryStatus.none);
  }
}
