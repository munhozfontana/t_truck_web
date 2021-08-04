import 'dart:math';

import 'package:get/get.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/enum/delivery_status_enum.dart';

class TruckDriversListController extends GetxController {
  RxList<TruckDriversEntity> list = <TruckDriversEntity>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    list.value = List.generate(
      50,
      (index) => TruckDriversEntity(
        cod: '$index',
        truckDriver: '$index truck',
        quantityDelivers: Random().nextInt(500).toString(),
        deliveryStatus:
            index % 2 == 0 ? DeliveryStatus.done : DeliveryStatus.inProgess,
      ),
    );
  }
}
