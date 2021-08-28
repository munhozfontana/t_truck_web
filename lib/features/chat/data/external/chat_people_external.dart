import 'dart:math';

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

      return Future.value(List.generate(
          20,
          (index) => ChatPerson(
                avatar: Text(
                  StringUtils.fisrtAndLastLatter(
                    Faker().person.name(),
                  ),
                ),
                id: index,
                name: Faker().person.firstName(),
                codPerson: Random().nextInt(999999).toString(),
                messages: [],
              )));
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
