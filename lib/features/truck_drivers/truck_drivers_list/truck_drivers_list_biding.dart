import 'package:get/get.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/data/external/protocols/i_truck_drivers_external.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/data/external/truck_drivers_external.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/data/repositories_impl/truck_drivers_repository.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/repositories/i_truck_drivers_repository.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/usecases/list_truck_drivers_case.dart';

import 'ui/truck_drivers_list_controller.dart';

class TruckDriversListBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ITruckDriversExternal>(
      () => TruckDriversExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<ITruckDriversRepository>(
      () => TruckDriversRepository(
        iTruckDriversExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ListTruckDriversCase(
        iTruckDriversRepository: Get.find(),
      ),
    );

    Get.put<TruckDriversListController>(
      TruckDriversListController(
        listTruckDriversCase: Get.find(),
      ),
    );
  }
}
