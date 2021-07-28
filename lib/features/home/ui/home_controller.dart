import 'package:get/get.dart';
import 'package:t_truck_web/core/components/map_component.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/use_cases/list_dashboard_case.dart';

import '../../../core/components/menu/menu_model.dart';
import '../../../core/utils/app_dialog.dart';

class HomeController extends GetxController {
  final IAppDialog appDialog;
  final IMenuComponentController menuComponentController;
  final IListDashboardCase iListDashboardCase;

  final Rx<DashBoardComposedEntity> dashboads = DashBoardComposedEntity().obs;
  final Rx<LocationMapEntity> currentPositonMap = LocationMapEntity(
    latitude: -15.7801,
    longitude: -47.9292,
  ).obs;

  HomeController({
    required this.appDialog,
    required this.menuComponentController,
    required this.iListDashboardCase,
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

  Future<void> getPanelData() async {
    (await iListDashboardCase(const Params())).fold(
      (l) => null,
      (r) => {
        dashboads.value = r,
        dashboads.refresh(),
      },
    );
  }
}
