import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/external/protocols/i_devolution_external.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/models/devolution_model.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/models/products_model.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';

class DevolutionExternal implements IDevolutionExternal {
  IHttp iHttp;

  DevolutionExternal({
    required this.iHttp,
  });

  @override
  Future<List<DevolutionEntity>> get() async {
    try {
      final res = await iHttp.getHttp(
        'http://truck.stoatacadista.com.br:2302/api/devolucoes',
      );

      return DioDriver.listExtract(res)
          .map((e) => DevolutionModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }

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
