import 'package:get/get.dart';

import 'ui/truck_drivers_list_controller.dart';

class TruckDriversListBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TruckDriversListController>(
      () => TruckDriversListController(),
    );
  }
}
