import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';

import '../../core/utils/app_dialog.dart';
import 'ui/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppDialog>(
      () => AppDialog(),
    );

    Get.put<HomeController>(
      HomeController(
        appDialog: Get.find(),
        menuComponentController: Get.find<MenuComponentController>(),
      ),
    );
  }
}
