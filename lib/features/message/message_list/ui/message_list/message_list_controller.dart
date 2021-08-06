import 'dart:math';

import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity_enum.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class MessageListController extends GetxController {
  RxList<MessageEntity> list = <MessageEntity>[].obs;

  @override
  void onInit() {
    final faker = Faker();
    super.onInit();
    list.value = List.generate(
      50,
      (index) => MessageEntity(
        cod: index,
        subject: faker.lorem.sentence(),
        status: MessageEntityEnum
            .values[Random().nextInt(MessageEntityEnum.values.length - 1)],
      ),
    );
  }

  void toDetailPage(MessageEntity e) {
    Get.toNamed('${Routes.message.path}/${e.cod}');
  }
}
