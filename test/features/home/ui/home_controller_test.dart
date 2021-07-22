import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([AppDialog])
void main() {
  late HomeController controller;
  AppDialog mockAppDialog;
  setUp(() {
    mockAppDialog = MockAppDialog();
    controller = HomeController(
      appDialog: mockAppDialog,
    );
  });

  test('should verify quantity after much elemnts', () {
    controller.addQuickAcces(MenuModel(text: 'a', route: '/a'));
    controller.addQuickAcces(MenuModel(text: 's', route: '/s'));
    controller.addQuickAcces(MenuModel(text: 'd', route: '/d'));
    controller.addQuickAcces(MenuModel(text: 'f', route: '/f'));
    controller.addQuickAcces(MenuModel(text: 'g', route: '/g'));
    controller.addQuickAcces(MenuModel(text: 'w', route: '/w'));
    controller.addQuickAcces(MenuModel(text: 'e', route: '/e'));
    expect(controller.quickAcces().length, 4);
    expect(controller.quickAcces().last.text, 'f');
    expect(controller.quickAcces().first.text, 'e');
  });
}
