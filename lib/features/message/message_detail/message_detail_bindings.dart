import 'package:get/get.dart';
import 'package:t_truck_web/features/message/message_detail/data/external/i_message_external/i_message_external.dart';
import 'package:t_truck_web/features/message/message_detail/data/external/message_external.dart';
import 'package:t_truck_web/features/message/message_detail/data/repositories_impl/message_repository.dart';
import 'package:t_truck_web/features/message/message_detail/domain/repository/i_message_repository.dart';
import 'package:t_truck_web/features/message/message_detail/domain/use_cases/list_message_case.dart';
import 'package:t_truck_web/features/message/message_detail/domain/use_cases/protocols/i_list_message_case.dart';
import 'package:t_truck_web/features/message/message_detail/ui/message_detail/message_detail_controller.dart';

class MessageDetailBindings implements Bindings {
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

    Get.lazyPut<IListMessageCase>(
      () => ListMessageCase(
        iMessageRepository: Get.find(),
      ),
    );

    Get.put<MessageDetailController>(
      MessageDetailController(
        iLoggedUser: Get.find(),
        iListMessageCase: Get.find(),
      ),
    );
  }
}
