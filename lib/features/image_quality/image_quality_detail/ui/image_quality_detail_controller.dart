import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/usecases/image_quality_detail_case.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/ui/image_quality_list_controller.dart';

class ImageQualityDetailController extends GetxController {
  RxList<TruckDriverImageModel> list = <TruckDriverImageModel>[].obs;
  late Rx<ImageQualityEntity> imageQualityEntity;

  ImageQualityDetailCase imageQualityDetailCase;

  ImageQualityDetailController({
    required this.imageQualityDetailCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    imageQualityEntity = Get.find<ImageQualityListController>()
        .list
        .firstWhere((element) => element.cod.toString() == Get.parameters['id'])
        .obs;

    (await imageQualityDetailCase(Params(id: imageQualityEntity.value.cod)))
        .fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }

  toDetailPage(TruckDriverImageModel e) {}
}
