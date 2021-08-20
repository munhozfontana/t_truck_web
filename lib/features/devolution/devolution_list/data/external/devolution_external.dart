import 'dart:math';

import 'package:faker/faker.dart';
import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/external/protocols/i_devolution_external.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/models/devolution_model.dart';
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
      // final res = await iHttp.getHttp(
      //   'http://truck.stoatacadista.com.br:2302/api/ocorrencia/$cod',
      // );

      // return DioDriver.listExtract(res)
      //     .map((e) => ProductsModel.fromMap(e as Map<String, dynamic>))
      //     .toList();

      final faker = Faker();
      final lisfake = List.generate(
        20,
        (index) => ProductsEntity(
          cod: index,
          name: faker.food.cuisine(),
          quantity: Random().nextInt(37),
          price: Random().nextInt(500),
          priceMount: Random().nextInt(2000),
        ),
      );
      return lisfake;
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
