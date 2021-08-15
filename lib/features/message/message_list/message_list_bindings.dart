import 'package:get/get.dart';

import 'ui/message_list/message_list_controller.dart';

class MessageListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageListController());
  }
}
