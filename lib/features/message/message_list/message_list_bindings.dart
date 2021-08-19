import 'package:get/get.dart';
import 'package:t_truck_web/features/message/message_list/data/external/message_external.dart';
import 'package:t_truck_web/features/message/message_list/data/external/protocols/i_message_external.dart';

import 'data/repositories_impl/message_repository.dart';
import 'domain/repositories/i_message_repository.dart';
import 'domain/usecases/list_message_case.dart';
import 'ui/message_list/message_list_controller.dart';

class MessageListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMessageExternal>(
      () => MessageExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IMessageRepository>(
      () => MessageRepository(
        iMessageExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ListMessageCase(
        iMessageRepository: Get.find(),
      ),
    );

    Get.put<MessageListController>(
      MessageListController(
        listMessageCase: Get.find(),
      ),
    );
  }
}
