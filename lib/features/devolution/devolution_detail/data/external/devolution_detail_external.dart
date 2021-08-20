import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/external/protocols/i_devolution_detail_external.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/models/products_model.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';

class DevolutionDetailExternal implements IDevolutionDetailExternal {
  IHttp iHttp;

  DevolutionDetailExternal({
    required this.iHttp,
  });

  @override
  Future<List<ProductsEntity>> getById(int cod) async {
    try {
      final res = await iHttp.postHttp(
          'http://truck.stoatacadista.com.br:2302/api/product',
          body: {
            'NUMTRANSVENDA': ['$cod']
          });

      return DioDriver.listExtract(res)
          .map((e) => ProductsModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
