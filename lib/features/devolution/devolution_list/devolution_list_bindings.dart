import 'package:get/get.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/devolution_detail_bindings.dart';

import 'ui/devolution_list/devolution_list_controller.dart';

class DevolutionListBindings implements Bindings {
  @override
  void dependencies() {
    DevolutionDetailBindings().dependencies();
    Get.lazyPut(() => DevolutionListController());
  }
}
