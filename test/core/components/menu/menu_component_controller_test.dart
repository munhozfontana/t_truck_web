import 'package:flutter_test/flutter_test.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';

void main() {
  late MenuComponentController controller;
  setUp(() {
    controller = MenuComponentController();
  });

  test('should verify quantity after much elemnts', () {
    controller.addQuickAcces(MenuModel(text: 'a', path: '/a'));
    controller.addQuickAcces(MenuModel(text: 's', path: '/s'));
    controller.addQuickAcces(MenuModel(text: 'd', path: '/d'));
    controller.addQuickAcces(MenuModel(text: 'f', path: '/f'));
    controller.addQuickAcces(MenuModel(text: 'g', path: '/g'));
    controller.addQuickAcces(MenuModel(text: 'w', path: '/w'));
    controller.addQuickAcces(MenuModel(text: 'e', path: '/e'));
    expect(controller.quickAcces().length, 4);
    expect(controller.quickAcces().last.text, 'f');
    expect(controller.quickAcces().first.text, 'e');
  });
}
