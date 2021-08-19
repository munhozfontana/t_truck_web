import 'package:get/get.dart';

import 'ui/message_detail/message_detail_controller.dart';

class MessageDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageDetailController());
  }
}
