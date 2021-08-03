import 'package:get/get.dart';
import 'package:t_truck_web/features/truck_drivers/ui/truck_drivers_controller.dart';

class TruckDriversBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<TruckDriversController>(
      TruckDriversController(),
    );
  }
}
