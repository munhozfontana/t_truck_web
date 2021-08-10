import 'dart:math';

import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolutions_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/enum/devolution_status_enum.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class DevolutionListController extends GetxController {
  RxList<DevolutionsEntity> list = <DevolutionsEntity>[].obs;

  @override
  void onInit() {
    final faker = Faker();
    super.onInit();
    list.value = List.generate(
        37,
        (index) => DevolutionsEntity(
            cod: index,
            client: faker.company.name(),
            status: DevolutionStatus
                .values[Random().nextInt(DevolutionStatus.values.length - 1)]));
  }

  void toDetailPage(DevolutionsEntity e) {
    Get.toNamed('${Routes.devolutions.path}/${e.cod}');
  }
}
