import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_dashboard_case.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_location_case.dart';
import 'package:t_truck_web/features/home/ui/home_page.dart';
import 'package:t_truck_web/features/map/entites/map_entites.dart';
import 'package:t_truck_web/features/map/map_controller.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import '../../../core/components/menu/menu_component_controller.dart';
import '../../../core/params/params.dart';
import '../../../core/utils/app_dialog.dart';
import '../domain/entities/dash_board_entity.dart';

class HomeController extends GetxController {
  final IAppDialog appDialog;
  final MenuComponentController menuComponentController;
  final IListDashboardCase iListDashboardCase;
  final IListLocationCase iListLocationCase;

  final Rx<DashBoardComposedEntity> dashboads = DashBoardComposedEntity(
    devolutions: DashBoardEntity(),
    finished: DashBoardEntity(),
    opened: DashBoardEntity(),
    pending: DashBoardEntity(),
  ).obs;

  final Rx<LocationMapEntity> currentPositonMap = LocationMapEntity(
    latitude: -15.7801,
    longitude: -47.9292,
  ).obs;

  late final Rx<Timer>? timer;

  HomeController({
    required this.appDialog,
    required this.menuComponentController,
    required this.iListDashboardCase,
    required this.iListLocationCase,
  });

  @override
  void onInit() {
    super.onInit();
    getPanelData();
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      iListLocationCase(const Params()).then(updadeListLocation);
    }).obs;
  }

  void addQuickAcces(Routes menuModel) {
    menuComponentController.addQuickAcces(menuModel);
  }

  void updateMap(LocationMapEntity value) {
    currentPositonMap.value = value;
    currentPositonMap.refresh();
  }

  Future<void> getPanelData() async {
    (await iListDashboardCase(const Params())).fold(
      (l) => null,
      (r) => {
        dashboads.value = r,
        dashboads.refresh(),
      },
    );

    updadeListLocation(await iListLocationCase(const Params()));
  }

  void updadeListLocation(
    Either<Failure, List<LocationEntity>> updadeListLocation,
  ) {
    updadeListLocation.fold(
      (l) => null,
      (r) => {
        Get.find<MapPageController>().markers.value = r
            .map(
              (element) => MarkerMapEntity(
                child: PositionMap(
                  color: selectColorByIdle(element),
                  message:
                      "${element.truck.cod} - ${DateFormat('dd/MM/yyyy HH:MM:ss').format(element.truck.createAt)}",
                ),
                name: element.truck.cod.toString(),
                locationMapEntity: LocationMapEntity(
                    latitude: element.latitude.toDouble(),
                    longitude: element.longitudade.toDouble()),
              ),
            )
            .toList()
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    timer!.value.cancel();
  }

  Color? selectColorByIdle(LocationEntity locationEntity) {
    final truckTime = locationEntity.truck.createAt;
    final localDateInBrasil =
        DateTime.now().toUtc().subtract(const Duration(hours: 3));

    if (localDateInBrasil.difference(truckTime).inHours >= 3) {
      return Colors.red;
    }

    if (localDateInBrasil.difference(truckTime).inHours >= 2) {
      return Colors.yellow;
    }

    return null;
  }
}
