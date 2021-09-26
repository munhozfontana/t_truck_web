import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/usecases/list_image_quality_case.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class ImageQualityListController extends GetxController {
  RxList<ImageQualityEntity> list = <ImageQualityEntity>[].obs;

  final ListImageQualityCase listImageQualityCase;

  ImageQualityListController({
    required this.listImageQualityCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    (await listImageQualityCase(const Params())).fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }

  void toDetailPage(ImageQualityEntity e) {
    Get.toNamed('${Routes.imageQuality.path}/${e.cod}');
  }
}
