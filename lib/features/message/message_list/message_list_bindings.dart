import 'package:get/get.dart';
import 'package:t_truck_web/features/message/message_detail/message_detail_bindings.dart';

import 'ui/message_list/message_list_controller.dart';

class MessageListBindings implements Bindings {
  @override
  void dependencies() {
    MessageDetailBindings().dependencies();
    Get.lazyPut(() => MessageListController());
  }
}
