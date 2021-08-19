import 'dart:math';

import 'package:faker/faker.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/external/protocols/i_devolution_external.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_status_enum.dart';

class DevolutionExternal implements IDevolutionExternal {
  IHttp iHttp;

  DevolutionExternal({
    required this.iHttp,
  });

  @override
  Future<List<DevolutionEntity>> get() async {
    try {
      // var res = await iHttp.postHttp(
      //   'http://truck.stoatacadista.com.br:2302/api/ocorrencia',
      // );

      // var resExtract = DioDriver.listExtract(res);

      final faker = Faker();
      return List.generate(
          37,
          (index) => DevolutionEntity(
              cod: index,
              client: faker.company.name(),
              status: DevolutionStatus.values[
                  Random().nextInt(DevolutionStatus.values.length - 1)]));
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
