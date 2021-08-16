import 'dart:math';

import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/enum/delivery_status_enum.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class TruckDriversListController extends GetxController {
  RxList<TruckDriversEntity> list = <TruckDriversEntity>[].obs;

  @override
  void onInit() {
    print('LOADING');
    final faker = Faker();
    super.onInit();
    list.value = List.generate(
      50,
      (index) => TruckDriversEntity(
        cod: '$index',
        truckDriver: faker.person.name(),
        quantityDelivers: Random().nextInt(100).toString(),
        status: DeliveryStatus
            .values[Random().nextInt(DeliveryStatus.values.length - 1)],
      ),
    );
  }

  void toDetailPage(TruckDriversEntity e) {
    Get.toNamed('${Routes.truckDrivers.path}/${e.cod}');
  }
}
