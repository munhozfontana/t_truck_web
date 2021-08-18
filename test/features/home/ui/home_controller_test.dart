import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_dashboard_case.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_location_case.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';
import 'package:t_truck_web/features/map/entites/map_entites.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([
  IAppDialog,
  IMenuComponentController,
  IListDashboardCase,
  IListLocationCase,
])
void main() {
  late HomeController homeController;
  late IAppDialog mockAppDialog;
  late IMenuComponentController mockMenuComponentController;
  late MockIListDashboardCase mockIListDashboardCase;
  late MockIListLocationCase mockiIListLocationCase;
  late Routes menuModel;
  late LocationMapEntity locationMapEntity;
  late DashBoardComposedEntity dashBoardComposedEntity;

  setUp(() {
    menuModel = Routes.message;
    dashBoardComposedEntity = DashBoardComposedEntity(
        devolutions: DashBoardEntity(),
        finished: DashBoardEntity(),
        opened: DashBoardEntity(),
        pending: DashBoardEntity());
    mockAppDialog = MockIAppDialog();
    mockMenuComponentController = MockIMenuComponentController();
    mockIListDashboardCase = MockIListDashboardCase();
    mockiIListLocationCase = MockIListLocationCase();
    locationMapEntity = LocationMapEntity(
      latitude: 2,
      longitude: 5,
    );
    homeController = HomeController(
        appDialog: mockAppDialog,
        menuComponentController: mockMenuComponentController,
        iListDashboardCase: mockIListDashboardCase,
        iListLocationCase: mockiIListLocationCase);
  });
  test('Should call add Quickaccess', () {
    when(mockMenuComponentController.addQuickAcces(menuModel))
        .thenAnswer((realInvocation) {
      return;
    });
    homeController.addQuickAcces(menuModel);
    verify(mockMenuComponentController.addQuickAcces(menuModel)).called(1);
  });

  test('Should update map values', () {
    homeController.updateMap(locationMapEntity);
    expect(homeController.currentPositonMap.value, locationMapEntity);
  });

  test('Should return panel data', () {
    when(mockIListDashboardCase(const Params())).thenAnswer(
        (realInvocation) => Future.value(Right(dashBoardComposedEntity)));
    when(mockiIListLocationCase(const Params()))
        .thenAnswer((realInvocation) => Future.value(Right([])));
    homeController.getPanelData();
  });
}
