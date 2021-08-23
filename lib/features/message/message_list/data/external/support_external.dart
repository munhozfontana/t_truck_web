import 'dart:math';

import 'package:faker/faker.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity_enum.dart';

import 'protocols/i_support_external.dart';

class SupportExternal implements ISupportExternal {
  IHttp iHttp;

  SupportExternal({
    required this.iHttp,
  });

  @override
  Future<List<SupportEntity>> get() async {
    try {
      // var res = await iHttp.postHttp(
      //   'http://truck.stoatacadista.com.br:2302/api/ocorrencia',
      // );

      // var resExtract = DioDriver.listExtract(res);

      final faker = Faker();
      return List.generate(
        50,
        (index) => SupportEntity(
          cod: index,
          subject: faker.lorem.sentence(),
          status: SupportEntityEnum
              .values[Random().nextInt(SupportEntityEnum.values.length - 1)],
          messageEntity: [],
          openAt: DateTime.now(),
        ),
      );
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
