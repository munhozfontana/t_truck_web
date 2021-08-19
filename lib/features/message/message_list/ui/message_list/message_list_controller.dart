import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/usecases/list_message_case.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class MessageListController extends GetxController {
  RxList<MessageEntity> list = <MessageEntity>[].obs;

  final ListMessageCase listMessageCase;

  MessageListController({
    required this.listMessageCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    (await listMessageCase(const Params())).fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }

  void toDetailPage(MessageEntity e) {
    Get.toNamed('${Routes.message.path}/${e.cod}');
  }
}
