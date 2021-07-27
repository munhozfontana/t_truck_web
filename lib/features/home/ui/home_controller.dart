import 'package:get/get.dart';
import 'package:t_truck_web/core/components/map_component.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';

import '../../../core/components/menu/menu_model.dart';
import '../../../core/utils/app_dialog.dart';

class HomeController extends GetxController {
  final AppDialog appDialog;
  final Rx<LocationMapEntity> currentPositonMap = LocationMapEntity(
    latitude: -15.7801,
    longitude: -47.9292,
  ).obs;

  HomeController({
    required this.appDialog,
  });

  void addQuickAcces(MenuModel menuModel) {
    Get.find<MenuComponentController>().addQuickAcces(menuModel);
  }

  void updateMap(LocationMapEntity value) {
    currentPositonMap.value = value;
    currentPositonMap.refresh();
  }
}
