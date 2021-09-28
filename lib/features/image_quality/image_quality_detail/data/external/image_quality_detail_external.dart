import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/external/protocols/i_image_quality_detail_external.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';

class ImageQualityDetailExternal implements IImageQualityDetailExternal {
  IHttp iHttp;

  ImageQualityDetailExternal({
    required this.iHttp,
  });

  @override
  Future<List<TruckDriverImageModel>> getById(int cod) async {
    try {
      final res = await iHttp.postHttp(
          'http://truck.stoatacadista.com.br:2302/api/imagemMotorista',
          body: {'codmot': cod});

      return DioDriver.listExtract(res)
          .map((e) => TruckDriverImageModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }

  @override
  Future<List<String>> getImageBtTruckDriverImage(
      TruckDriverImageModel truckDriverImageModel) async {
    try {
      final res = await iHttp.postHttp(
          'http://truck.stoatacadista.com.br:2302/api/imagemMotorista/imagem',
          body: {
            'codmot': truckDriverImageModel.codMotorista.toString(),
            'numtransvenda': truckDriverImageModel.numTrasnvenda
          });

      return DioDriver.listExtract(res).cast<String>();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
