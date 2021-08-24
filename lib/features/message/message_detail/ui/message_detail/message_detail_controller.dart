import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_detail/domain/use_cases/protocols/i_list_message_case.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity.dart';
import 'package:t_truck_web/features/message/message_list/ui/message_list/message_list_controller.dart';

class MessageDetailController extends GetxController {
  IListMessageCase iListMessageCase;
  ILoggedUser iLoggedUser;

  RxList<MessageEntity> list = <MessageEntity>[].obs;

  late Rx<SupportEntity> supportEntity;

  MessageDetailController({
    required this.iListMessageCase,
    required this.iLoggedUser,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    supportEntity = Get.find<MessageListController>()
        .list
        .firstWhere((element) => element.cod.toString() == Get.parameters['id'])
        .obs;

    (await iListMessageCase(const Params(id: 1))).fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }
}
