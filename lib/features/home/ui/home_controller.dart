import 'package:get/get.dart';
import 'package:t_truck_web/core/components/map_component.dart';

import '../../../core/components/menu/menu_model.dart';
import '../../../core/utils/app_dialog.dart';
import '../domain/use_cases/map_use_case.dart';

class HomeController extends GetxController {
  final MapUseCase mapUseCase;
  final AppDialog appDialog;
  final RxList<MenuModel> quickAcces = <MenuModel>[].obs;
  final Rx<LocationMapEntity> currentPositonMap = LocationMapEntity(
    latitude: -15.7801,
    longitude: -47.9292,
  ).obs;

  HomeController({
    required this.mapUseCase,
    required this.appDialog,
  });

  void addQuickAcces(MenuModel menuModel) {
    if (quickAcces.isEmpty || !quickAcces.any((item) => item == menuModel)) {
      quickAcces.insert(0, menuModel);
    }

    if (quickAcces.length >= 5) {
      quickAcces.removeLast();
    }
  }

  void updateMap(LocationMapEntity value) {
    currentPositonMap.value = value;
    currentPositonMap.refresh();
  }
}
