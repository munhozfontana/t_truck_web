import 'package:get/get.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/external/image_quality_detail_external.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/external/protocols/i_image_quality_detail_external.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/repositories_impl/image_quality_detail_repository.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/repositories/i_image_quality_detail_repository.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/usecases/image_quality_case.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/usecases/image_quality_detail_case.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/image_quality_list_bindings.dart';

import 'ui/image_quality_detail_controller.dart';

class ImageQualityDetailBindings implements Bindings {
  @override
  void dependencies() {
    ImageQualityListBindings().dependencies();

    Get.lazyPut<IImageQualityDetailExternal>(
      () => ImageQualityDetailExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IImageQualityDetailRepository>(
      () => ImageQualityDetailRepository(
        iImageQualityDetailExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ImageQualityDetailCase(
        iImageQualityDetailRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ImageQualityCase(
        iImageQualityDetailRepository: Get.find(),
      ),
    );

    Get.lazyPut<ImageQualityDetailController>(
      () => ImageQualityDetailController(
          imageQualityDetailCase: Get.find(), imageQualityCase: Get.find()),
    );
  }
}
