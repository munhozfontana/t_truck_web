import 'package:get/get.dart';

import '../domain/entities/truck_drivers_entity.dart';
import '../domain/enum/delivery_status_enum.dart';

class TruckDriversController extends GetxController {
  RxList<TruckDriversEntity> list = <TruckDriversEntity>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    list.add(
      TruckDriversEntity(
        cod: "1",
        truckDriver: "Fulano",
        quantityDelivers: "2",
        deliveryStatus: DeliveryStatus.inProgess,
      ),
    );
    list.add(
      TruckDriversEntity(
        cod: "2",
        truckDriver: "Fulano2",
        quantityDelivers: "5",
        deliveryStatus: DeliveryStatus.done,
      ),
    );
  }
}
