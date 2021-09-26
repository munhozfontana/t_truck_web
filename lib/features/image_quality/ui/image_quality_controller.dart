import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/domain/entities/image_quality_entity.dart';
import 'package:t_truck_web/features/image_quality/domain/usecases/list_image_quality_case.dart';

class ImageQualityController extends GetxController {
  RxList<ImageQualityEntity> list = <ImageQualityEntity>[].obs;

  final ListImageQualityCase listImageQualityCase;

  ImageQualityController({
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
}
