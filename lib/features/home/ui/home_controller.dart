import 'package:get/get.dart';
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_dashboard_case.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_location_case.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import '../../../core/components/map_component.dart';
import '../../../core/components/menu/menu_component_controller.dart';
import '../../../core/params/params.dart';
import '../../../core/utils/app_dialog.dart';
import '../domain/entities/dash_board_entity.dart';

class HomeController extends GetxController {
  final IAppDialog appDialog;
  final IMenuComponentController menuComponentController;
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
    pathBack: Routes.home.path,
  ).obs;

  final RxList<LocationEntity> locationEntity = <LocationEntity>[].obs;

  HomeController({
    required this.appDialog,
    required this.menuComponentController,
    required this.iListDashboardCase,
    required this.iListLocationCase,
  });

  @override
  void onInit() {
    getPanelData();
    super.onInit();
  }

  void addQuickAcces(Routes menuModel) {
    menuComponentController.addQuickAcces(menuModel);
  }

  void updateMap(LocationMapEntity value) {
    currentPositonMap.value = value;
    currentPositonMap.refresh();
  }

  Future<void> getPanelData() async {
    final combineRes = await Future.wait([
      iListDashboardCase(const Params()),
      iListLocationCase(const Params()),
    ]);

    print(combineRes);

    combineRes.first.fold(
      (l) => null,
      (r) => {
        dashboads.value = r as DashBoardComposedEntity,
        dashboads.refresh(),
      },
    );
    combineRes.last.fold(
      (l) => null,
      (r) => {
        locationEntity.value = r as List<LocationEntity>,
        locationEntity.refresh(),
      },
    );
  }
}
