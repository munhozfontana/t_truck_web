import 'package:get/get.dart';
import 'package:t_truck_web/features/image_quality/data/external/image_quality_external.dart';
import 'package:t_truck_web/features/image_quality/data/external/protocols/i_image_quality_external.dart';
import 'package:t_truck_web/features/image_quality/data/repositories_impl/image_quality_repository.dart';
import 'package:t_truck_web/features/image_quality/domain/repositories/i_image_quality_repository.dart';
import 'package:t_truck_web/features/image_quality/domain/usecases/list_image_quality_case.dart';

import 'ui/image_quality_controller.dart';

class ImageQualityBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IImageQualityExternal>(
      () => ImageQualityExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IImageQualityRepository>(
      () => ImageQualityRepository(
        iImageQualityExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ListImageQualityCase(
        iImageQualityRepository: Get.find(),
      ),
    );

    Get.lazyPut<ImageQualityController>(
      () => ImageQualityController(
        listImageQualityCase: Get.find(),
      ),
    );
  }
}
