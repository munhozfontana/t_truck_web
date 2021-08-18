import 'package:get/get.dart';

import 'map_controller.dart';

class MapPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MapPageController(), permanent: true);
  }
}
