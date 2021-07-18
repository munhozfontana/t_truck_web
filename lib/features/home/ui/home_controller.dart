import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/adapters/map/map_entity.dart';
import '../../../core/params/params.dart';
import '../../../core/utils/app_dialog.dart';
import '../domain/use_cases/map_use_case.dart';

class HomeController extends GetxController {
  final MapUseCase mapUseCase;
  Rx<MapEntity> mapEntity = MapEntity(map: Container()).obs;

  HomeController({
    required this.mapUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    createMap();
  }

  void createMap() {
    mapUseCase(Params()).fold(
      (l) => AppDialog.error(titulo: l.detail),
      (r) {
        mapEntity.value = r;
      },
    );
  }
}
