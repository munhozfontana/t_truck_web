import 'package:get/get.dart';

import 'menu_component_controller.dart';

class MenuBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuComponentController>(
      MenuComponentController(),
      permanent: true,
    );
  }
}
