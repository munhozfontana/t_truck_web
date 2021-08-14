import 'package:get/get.dart';

import 'menu_component_controller.dart';

class MenuBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuComponentController>(
      () => MenuComponentController(),
    );
  }
}
