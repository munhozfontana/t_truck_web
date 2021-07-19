import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/adapters/map/map_entity.dart';
import '../../../core/components/menu/menu_model.dart';
import '../../../core/params/params.dart';
import '../../../core/utils/app_dialog.dart';
import '../domain/use_cases/map_use_case.dart';

class HomeController extends GetxController {
  final MapUseCase mapUseCase;
  final AppDialog appDialog;
  Rx<MapEntity> mapEntity = MapEntity(map: Container()).obs;
  final RxList<MenuModel> quickAcces = <MenuModel>[].obs;

  HomeController({
    required this.mapUseCase,
    required this.appDialog,
  });

  @override
  void onInit() {
    super.onInit();
    createMap();
  }

  void createMap() {
    mapUseCase(const Params()).fold(
      (l) => appDialog.error(menssagem: l.detail),
      (r) => mapEntity.value = r,
    );
  }

  void addQuickAcces(MenuModel menuModel) {
    if (quickAcces.isEmpty || !quickAcces.any((item) => item == menuModel)) {
      quickAcces.insert(0, menuModel);
    }

    if (quickAcces.length >= 5) {
      quickAcces.removeLast();
    }
  }

  RxList<MenuModel> get quickAccess => quickAcces;
}
