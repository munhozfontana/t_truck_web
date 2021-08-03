import 'package:get/get.dart';

import 'core/components/menu/menu_biding.dart';
import 'core/core_bidings.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    CoreBiding().dependencies();
    MenuBiding().dependencies();
  }
}
