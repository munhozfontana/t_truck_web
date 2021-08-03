import 'package:get/get.dart';

import 'ui/truck_drivers_detail_controller.dart';

class TruckDriversDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TruckDriversDetailController());
  }
}
