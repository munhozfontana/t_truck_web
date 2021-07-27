import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';

class MenuBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuComponentController(), permanent: true);
  }
}
