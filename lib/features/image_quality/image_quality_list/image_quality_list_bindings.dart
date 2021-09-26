import 'package:get/get.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/data/external/protocols/i_image_quality_external.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/data/repositories_impl/image_quality_repository.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/repositories/i_image_quality_repository.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/usecases/list_image_quality_case.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/ui/image_quality_list_controller.dart';

import 'data/external/image_quality_external.dart';

class ImageQualityListBindings implements Bindings {
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

    Get.lazyPut<ImageQualityListController>(
      () => ImageQualityListController(
        listImageQualityCase: Get.find(),
      ),
    );
  }
}
