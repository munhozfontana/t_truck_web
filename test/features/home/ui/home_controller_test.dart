import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:t_truck_web/core/components/map_component.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([IAppDialog, IMenuComponentController])
void main() {
  late HomeController homeController;
  late IAppDialog mockAppDialog;
  late IMenuComponentController mockMenuComponentController;
  late MenuModel menuModel;
  late LocationMapEntity locationMapEntity;

  setUp(() {
    menuModel = MenuModel(text: '', path: '');
    mockAppDialog = MockIAppDialog();
    mockMenuComponentController = MockIMenuComponentController();
    locationMapEntity = LocationMapEntity(
      latitude: 2,
      longitude: 5,
    );
    homeController = HomeController(
        appDialog: mockAppDialog,
        menuComponentController: mockMenuComponentController);
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
    homeController.getPanelData();
  });
}
