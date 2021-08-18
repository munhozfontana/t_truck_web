import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/map/entites/map_entites.dart';
import 'package:t_truck_web/features/map/map_page.dart';

class MapPageController extends GetxController {
  Rx<FluterMapAdapterController> controlChildMap =
      FluterMapAdapterController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  final Rx<LocationMapEntity> initialPosition = LocationMapEntity(
    latitude: 0.0,
    longitude: 0.0,
  ).obs;

  final RxList<MarkerMapEntity> markers = <MarkerMapEntity>[].obs;

  final Rx<LocationMapEntity> lastPostion = LocationMapEntity(
    latitude: 0,
    longitude: 0,
  ).obs;

  void onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dy < 0) {
        controlChildMap.value.center();
        controlChildMap.value.move(
            controlChildMap.value.center(), controlChildMap.value.zoom() + 1);
      } else {
        controlChildMap.value.zoom();
        controlChildMap.value.move(
            controlChildMap.value.center(), controlChildMap.value.zoom() - 1);
      }
    }
  }
}
