import 'package:get/get.dart';

import '../../core/utils/app_dialog.dart';
import 'ui/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppDialog>(
      AppDialog(),
      permanent: true,
    );

    Get.put<HomeController>(
        HomeController(
          appDialog: Get.find(),
        ),
        permanent: true);
  }
}
