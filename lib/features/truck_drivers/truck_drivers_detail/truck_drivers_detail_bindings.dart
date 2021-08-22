import 'package:get/get.dart';
import 'package:t_truck_web/features/home/home_biding.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/data/external/protocols/i_truck_drivers_details_external.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/data/external/truck_drivers_details_external.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/data/repositories_impl/truck_drivers_details_repository.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/repositories/i_truck_drivers_details_repository.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/use_cases/list_truck_details_orders_case.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/use_cases/protocols/i_list_truck_details_orders_case.dart';

import 'ui/truck_drivers_detail_controller.dart';

class TruckDriversDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ITruckDriversDetailsExternal>(
      () => TruckDriversDetailsExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<ITruckDriversDetailsRepository>(
      () => TruckDriversDetailsRepository(
        iTruckDriversDetailsExternal: Get.find(),
      ),
    );

    Get.lazyPut<ITruckDriversDetailsRepository>(
      () => TruckDriversDetailsRepository(
        iTruckDriversDetailsExternal: Get.find(),
      ),
    );

    Get.lazyPut<IListTruckDetailsOrdersCase>(
      () => ListTruckDetailsOrdersCase(
        iTruckDriversDetailsRepository: Get.find(),
      ),
    );

    HomeBiding().location();

    Get.put<TruckDriversDetailController>(
      TruckDriversDetailController(
        iListTruckDetailsOrdersCase: Get.find(),
        iListLocationCase: Get.find(),
      ),
    );
  }
}
