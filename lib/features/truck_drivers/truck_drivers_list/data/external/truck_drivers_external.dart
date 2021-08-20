import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/data/models/truck_drivers_model.dart';
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
      final res = await iHttp.getHttp(
        'http://truck.stoatacadista.com.br:2302/api/motorista/',
      );

      return DioDriver.listExtract(res)
          .map((e) => TruckDriversModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
