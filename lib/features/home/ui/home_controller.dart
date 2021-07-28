import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/map_component.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/use_cases/list_dashboard.dart';

import '../../../core/components/menu/menu_model.dart';
import '../../../core/utils/app_dialog.dart';

class HomeController extends GetxController {
  final IAppDialog appDialog;
  final IMenuComponentController menuComponentController;
  final IListDashboardUseCase iListDashboardUseCase;

  final Rx<DashBoardComposedEntit> dashboads = DashBoardComposedEntit().obs;
  final Rx<LocationMapEntity> currentPositonMap = LocationMapEntity(
    latitude: -15.7801,
    longitude: -47.9292,
  ).obs;

  HomeController({
    required this.appDialog,
    required this.menuComponentController,
    required this.iListDashboardUseCase,
  });

  @override
  void onInit() {
    getPanelData();
    super.onInit();
  }

  void addQuickAcces(MenuModel menuModel) {
    menuComponentController.addQuickAcces(menuModel);
  }

  void updateMap(LocationMapEntity value) {
    currentPositonMap.value = value;
    currentPositonMap.refresh();
  }

  void getPanelData() {
    dashboads.value = DashBoardComposedEntit(
      finished: DashBoardEntity(
        quantity: '231',
        description: 'Concluído',
        icon: Icons.done,
        colorIcon: const Color(0xFF45D36D),
      ),
      devolutions: DashBoardEntity(
        quantity: '8',
        description: 'Devoluções',
        icon: MenuIcons.subdirectory_arrow_right,
        colorIcon: const Color(0xFF2050FA),
        inverted: true,
      ),
      opened: DashBoardEntity(
        quantity: '24',
        description: 'Em aberto',
        icon: Icons.view_in_ar_outlined,
        colorIcon: Colors.black,
      ),
      pending: DashBoardEntity(
        quantity: '11',
        description: 'Pendentes',
        icon: Icons.info_outline,
        colorIcon: const Color(0xFFF4CE49),
      ),
    );
  }
}
