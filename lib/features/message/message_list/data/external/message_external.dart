import 'dart:math';

import 'package:faker/faker.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity_enum.dart';

import 'protocols/i_message_external.dart';

class MessageExternal implements IMessageExternal {
  IHttp iHttp;

  MessageExternal({
    required this.iHttp,
  });

  @override
  Future<List<MessageEntity>> get() async {
    try {
      // var res = await iHttp.postHttp(
      //   'http://truck.stoatacadista.com.br:2302/api/ocorrencia',
      // );

      // var resExtract = DioDriver.listExtract(res);

      final faker = Faker();
      return List.generate(
        50,
        (index) => MessageEntity(
          cod: index,
          subject: faker.lorem.sentence(),
          status: MessageEntityEnum
              .values[Random().nextInt(MessageEntityEnum.values.length - 1)],
        ),
      );
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
