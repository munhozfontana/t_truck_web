import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_biding.dart';
import 'package:t_truck_web/core/core_bidings.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    CoreBiding().dependencies();
    MenuBiding().dependencies();
  }
}
