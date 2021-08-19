import 'package:get/get.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/truck_drivers_list_biding.dart';

import 'ui/truck_drivers_detail_controller.dart';

class TruckDriversDetailBindings implements Bindings {
  @override
  void dependencies() {
    TruckDriversListBiding().dependencies();
    Get.lazyPut(() => TruckDriversDetailController());
  }
}
