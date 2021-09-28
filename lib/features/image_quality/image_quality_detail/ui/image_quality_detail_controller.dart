import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/usecases/image_quality_case.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/usecases/image_quality_detail_case.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/ui/image_quality_list_controller.dart';

class ImageQualityDetailController extends GetxController {
  RxList<TruckDriverImageModel> list = <TruckDriverImageModel>[].obs;
  late Rx<ImageQualityEntity> imageQualityEntity;

  RxString image = ''.obs;

  ImageQualityDetailCase imageQualityDetailCase;
  ImageQualityCase imageQualityCase;

  RxBool loadingImage = false.obs;

  ImageQualityDetailController({
    required this.imageQualityDetailCase,
    required this.imageQualityCase,
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

  Future<void> toDetailPage(TruckDriverImageModel e) async {
    loadingImage.value = true;
    (await imageQualityCase(Params(truckDriverImageModel: e))).fold(
      (l) => null,
      (r) {
        final size = MediaQuery.of(Get.context!).size;
        showDialog(
          context: Get.context!,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width * .8,
                height: size.height * .8,
                child: PhotoViewGallery.builder(
                  enableRotation: true,
                  itemCount: r.length,
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: MemoryImage(base64Decode(r[index])),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      heroAttributes: PhotoViewHeroAttributes(tag: index),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
    loadingImage.value = false;
  }
}
