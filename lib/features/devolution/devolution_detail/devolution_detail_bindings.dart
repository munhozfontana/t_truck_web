import 'package:get/get.dart';

import 'ui/devolution_detail/devolution_detail_controller.dart';

class DevolutionDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DevolutionDetailController());
  }
}
