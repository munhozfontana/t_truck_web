import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import 'menu_component_controller_test.mocks.dart';

@GenerateMocks([ILoggedUser])
void main() {
  late MenuComponentController controller;
  setUp(() {
    controller = MenuComponentController(iLoggedUser: MockILoggedUser());
  });

  test('should verify quantity after much elemnts', () {
    controller.addQuickAcces(Routes.config);
    controller.addQuickAcces(Routes.message);
    controller.addQuickAcces(Routes.home);
    controller.addQuickAcces(Routes.homeMap);
    controller.addQuickAcces(Routes.message);
    controller.addQuickAcces(Routes.unknown);
    controller.addQuickAcces(Routes.config);
    expect(controller.quickAcces().length, 4);
    expect(controller.quickAcces().last, Routes.home);
    expect(controller.quickAcces().first, Routes.config);
  });
}
