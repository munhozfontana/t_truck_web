import 'package:get/get.dart';
import 'package:t_truck_web/core/store_controller.dart';
import 'package:t_truck_web/features/login/login_biding.dart';
import 'package:t_truck_web/features/login/token_biding.dart';

import 'core/components/menu/menu_biding.dart';
import 'core/core_bidings.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreController(), permanent: true);
    TokenBiding().dependencies();
    CoreBiding().dependencies();
    MenuBiding().dependencies();
    LoginBiding().dependencies();
  }
}
