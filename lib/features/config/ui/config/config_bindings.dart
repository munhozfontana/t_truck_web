import 'package:get/get.dart';

import './config_controller.dart';

class ConfigBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfigController());
  }
}
