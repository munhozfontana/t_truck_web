import 'package:get/get.dart';
import 'package:t_truck_web/features/message/message_list/data/external/protocols/i_support_external.dart';
import 'package:t_truck_web/features/message/message_list/data/external/support_external.dart';

import 'data/repositories_impl/message_repository.dart';
import 'domain/repositories/i_support_repository.dart';
import 'domain/usecases/list_support_case.dart';
import 'ui/message_list/message_list_controller.dart';

class MessageListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISupportExternal>(
      () => SupportExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<ISupportRepository>(
      () => SupportRepository(
        iSupportExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ListSupportCase(
        iSupportRepository: Get.find(),
      ),
    );

    Get.put<MessageListController>(
      MessageListController(
        listMessageCase: Get.find(),
      ),
    );
  }
}
