import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_dashboard_repository.dart';
import 'package:t_truck_web/features/home/domain/use_cases/list_dashboard.dart';

import 'ui/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDasboadRepository>(
      () => DasboadRepository(),
    );

    Get.lazyPut<IListDashboardUseCase>(
      () => ListDashboardUseCase(
        iDasboadRepository: Get.find(),
      ),
    );

    Get.put<HomeController>(
      HomeController(
        appDialog: Get.find(),
        menuComponentController: Get.find<MenuComponentController>(),
        iListDashboardUseCase: Get.find(),
      ),
    );
  }
}
