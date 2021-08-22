import 'dart:async';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_location_case.dart';
import 'package:t_truck_web/features/home/ui/home_page.dart';
import 'package:t_truck_web/features/map/entites/map_entites.dart';
import 'package:t_truck_web/features/map/map_controller.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/use_cases/protocols/i_list_truck_details_orders_case.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

class TruckDriversDetailController extends GetxController {
  final IListTruckDetailsOrdersCase iListTruckDetailsOrdersCase;
  final IListLocationCase iListLocationCase;

  Rx<TruckDriversEntity> truckDriversEntity = TruckDriversEntity(
          cod: '',
          status: DeliveryStatus.done,
          quantityDelivers: '',
          truckDriver: '')
      .obs;

  RxList<OrderEntity> list = <OrderEntity>[].obs;
  RxString codMot = "".obs;

  final mapPageController = Get.find<MapPageController>();

  TruckDriversDetailController({
    required this.iListTruckDetailsOrdersCase,
    required this.iListLocationCase,
  });

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters['id'] == null) {
      Get.back();
    }
  }

  Future<void> getInitData() async {
    (await iListTruckDetailsOrdersCase(Params(id: int.parse(codMot.value))))
        .fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    captureCodFromUri();
    removeTruckAt();
    getInitData();
  }

  void captureCodFromUri() {
    codMot.value = Get.parameters['id']!;
  }

  void removeTruckAt() {
    var isTruckAtMap = mapPageController.markers
        .where(
          (element) => element.name == codMot.value,
        )
        .isNotEmpty;

    if (isTruckAtMap) {
      mapPageController.markers.removeWhere(
        (element) => element.name != codMot.value,
      );
      if (mapPageController.markers.isNotEmpty) {
        final marker = mapPageController.markers.first;
        mapPageController.controlChildMap.value.move(
          LatLng(
            marker.locationMapEntity.latitude,
            marker.locationMapEntity.longitude,
          ),
          17,
        );
      }
    } else {
      AppDialog().warning(
          menssagem:
              'O motorista do código ${codMot.value} não iniciou as entregas!');
    }
  }

  @override
  void onClose() {
    reloadTrucks();
    super.onClose();
  }

  Future<void> reloadTrucks() async {
    (await iListLocationCase(Params())).fold(
      (l) => null,
      (r) => {
        Get.find<MapPageController>().markers.value = r
            .map(
              (element) => MarkerMapEntity(
                child: PositionMap(
                  message: "Motorista ${element.truck.cod}",
                ),
                name: element.truck.cod.toString(),
                locationMapEntity: LocationMapEntity(
                    latitude: element.latitude.toDouble(),
                    longitude: element.longitudade.toDouble()),
              ),
            )
            .toList(),
        Get.find<MapPageController>().resetPostionMap()
      },
    );
  }
}
