import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/home/data/models/location_model.dart';
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';

import 'protocols/i_location_external.dart';

class LocationExternal implements ILocationExternal {
  IHttp iHttp;

  LocationExternal({
    required this.iHttp,
  });

  @override
  Future<List<LocationEntity>> get() async {
    try {
      var res = await iHttp.getHttp(
          'http://truck.stoatacadista.com.br:2302/api/location',
          headers: {'not_load': 'true'});

      return DioDriver.listExtract(res)
          .map((e) => LocationModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
