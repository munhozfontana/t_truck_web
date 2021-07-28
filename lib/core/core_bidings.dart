import 'package:get/get.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';

class CoreBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAppDialog>(AppDialog());
  }
}
