import 'package:get/get.dart';

import 'truck_drivers_list/ui/truck_drivers_controller.dart';

class TruckDriversBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<TruckDriversController>(
      TruckDriversController(),
    );
  }
}
