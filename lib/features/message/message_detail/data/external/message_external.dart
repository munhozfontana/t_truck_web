import 'package:faker/faker.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/message/message_detail/data/external/i_message_external/i_message_external.dart';
import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';

class MessageExternal implements IMessageExternal {
  IHttp iHttp;

  MessageExternal({
    required this.iHttp,
  });

  @override
  Future<List<MessageEntity>> getById(int cod) async {
    try {
      // final res = await iHttp.postHttp(
      //   'http://truck.stoatacadista.com.br:2302/api/message',
      //   body: message.toJson(),
      // );
      // return MessageEntity.fromMap(DioDriver.bodyExtract(res));
      return List.generate(
          20,
          (index) => MessageEntity(
                id: index,
                nameFrom: index % 2 == 0 ? "A" : "B",
                nameTo: index % 2 == 0 ? "B" : "A",
                content: Faker().lorem.sentence(),
                sendAt: DateTime.now().add(Duration(minutes: index * 3)),
              ));
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
