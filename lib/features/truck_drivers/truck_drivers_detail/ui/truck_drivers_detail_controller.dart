import 'dart:math';

import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/map/entites/map_entites.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/cliente_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/ui/truck_drivers_list_controller.dart';

class TruckDriversDetailController extends GetxController {
  Rx<TruckDriversEntity> truckDriversEntity = TruckDriversEntity(
          cod: '',
          status: DeliveryStatus.done,
          quantityDelivers: '',
          truckDriver: '')
      .obs;

  RxList<ClienteEntity> list = <ClienteEntity>[].obs;

  @override
  void onInit() {
    final faker = Faker();
    list.value = List.generate(
        20,
        (index) => ClienteEntity(
            numOrder: index,
            nf: Random().nextInt(50),
            clientName: faker.company.name(),
            status: DeliveryStatus
                .values[Random().nextInt(DeliveryStatus.values.length - 1)]));

    truckDriversEntity.value = Get.find<TruckDriversListController>()
        .list
        .firstWhere((element) => element.cod == Get.parameters['id']);

    super.onInit();
  }

  updateMap(LocationMapEntity value) {}
}
