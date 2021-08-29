import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/utils/string_utils.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_person_entity.dart';

import 'protocols/i_chat_people_external.dart';

class ChatPeopleExternal implements IChatPeopleExternal {
  IHttp iHttp;

  ChatPeopleExternal({
    required this.iHttp,
  });

  @override
  Future<List<ChatPerson>> listByToken(int perfil) async {
    try {
      // final res = await iHttp.postHttp(
      //     'http://truck.stoatacadista.com.br:2302/api/product',
      //     body: {
      //       'NUMTRANSVENDA': ['$cod']
      //     });

      return [
        ChatPerson(
          avatar: Text(
            StringUtils.fisrtAndLastLatter(
              Faker().person.name(),
            ),
          ),
          id: 0,
          name: Faker().person.firstName(),
          codPerson: 1.toString(),
          messages: [],
        ),
        ChatPerson(
          avatar: Text(
            StringUtils.fisrtAndLastLatter(
              Faker().person.name(),
            ),
          ),
          id: 0,
          name: Faker().person.firstName(),
          codPerson: 355911.toString(),
          messages: [],
        ),
      ];
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
