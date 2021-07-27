import 'package:get/get.dart';

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
      ),
    );
  }
}
