import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/data/models/devolution_model.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';

import 'protocols/i_image_quality_external.dart';

class ImageQualityExternal implements IImageQualityExternal {
  IHttp iHttp;

  ImageQualityExternal({
    required this.iHttp,
  });

  @override
  Future<List<ImageQualityEntity>> get() async {
    try {
      final res = await iHttp.postHttp(
        'http://truck.stoatacadista.com.br:2302/api/imagemMotorista',
      );

      return DioDriver.listExtract(res)
          .map((e) => ImageQualityModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
