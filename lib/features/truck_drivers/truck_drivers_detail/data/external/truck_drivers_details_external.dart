import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/data/models/order_model.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';

import 'protocols/i_truck_drivers_details_external.dart';

class TruckDriversDetailsExternal implements ITruckDriversDetailsExternal {
  IHttp iHttp;

  TruckDriversDetailsExternal({
    required this.iHttp,
  });

  @override
  Future<List<OrderEntity>> getById(int codMot) async {
    try {
      final res = await iHttp.postHttp(
          'http://truck.stoatacadista.com.br:2302/api/entregas/',
          body: {'codmot': codMot});

      return DioDriver.listExtract(res)
          .map((e) => OrderModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
