import 'dart:math';

import 'package:faker/faker.dart';
import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

import 'protocols/i_truck_drivers_external.dart';

class TruckDriversExternal implements ITruckDriversExternal {
  IHttp iHttp;

  TruckDriversExternal({
    required this.iHttp,
  });

  @override
  Future<List<TruckDriversEntity>> get() async {
    try {
      var res = await iHttp.postHttp(
        'http://truck.stoatacadista.com.br:2302/api/ocorrencia',
      );

      var resExtract = DioDriver.listExtract(res);

      final faker = Faker();
      return List.generate(
        50,
        (index) => TruckDriversEntity(
          cod: '$index',
          truckDriver: faker.person.name(),
          quantityDelivers: Random().nextInt(100).toString(),
          status: DeliveryStatus
              .values[Random().nextInt(DeliveryStatus.values.length - 1)],
        ),
      );
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
