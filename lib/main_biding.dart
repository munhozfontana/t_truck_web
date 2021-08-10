import 'package:get/get.dart';
import 'package:t_truck_web/core/store_controller.dart';

import 'core/components/menu/menu_biding.dart';
import 'core/core_bidings.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreController(), permanent: true);
    CoreBiding().dependencies();
    MenuBiding().dependencies();
  }
}
