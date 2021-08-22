import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:t_truck_web/features/map/entites/map_entites.dart';
import 'package:t_truck_web/features/map/map_page.dart';

class MapPageController extends GetxController {
  Rx<FluterMapAdapterController> controlChildMap =
      FluterMapAdapterController().obs;

  final Rx<LocationMapEntity> initialPosition = LocationMapEntity(
    latitude: -15.784245857882606,
    longitude: -48.14222219029218,
  ).obs;

  final RxDouble initialZoom = 13.0.obs;

  final RxList<MarkerMapEntity> markers = <MarkerMapEntity>[].obs;

  Rx<LatLng>? lastPostion;

  Rx<double>? lastZoom;

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
      lastZoom = controlChildMap.value.zoom().obs;
    }
  }

  void onPositionChanged(MapPosition a, bool b) {
    lastPostion = LatLng(
      a.center!.latitude,
      a.center!.longitude,
    ).obs;
    if (a.zoom != null) {
      lastZoom = a.zoom!.obs;
    }
  }

  void resetPostionMap() {
    lastPostion?.value = LatLng(
      initialPosition.value.latitude,
      initialPosition.value.longitude,
    );
    lastZoom?.value = initialZoom.value;
  }
}
