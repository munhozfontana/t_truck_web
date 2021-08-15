import 'package:get/get.dart';

import 'ui/devolution_list/devolution_list_controller.dart';

class DevolutionListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DevolutionListController());
  }
}
