import 'package:get/get.dart';
import 'package:t_truck_web/features/home/data/external/i_dashboard.dart';
import 'package:t_truck_web/features/home/data/repositories_impl/dashboard_repository.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_dashboard_repository.dart';
import 'package:t_truck_web/features/home/domain/use_cases/list_dashboard.dart';

import 'ui/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDashboardExternal>(
      () => DashboardExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IDasboadRepository>(
      () => DasboadRepository(
        iDashboardExternal: Get.find(),
      ),
    );

    Get.lazyPut<IListDashboardUseCase>(
      () => ListDashboardUseCase(
        iDasboadRepository: Get.find(),
      ),
    );

    Get.put<HomeController>(
      HomeController(
        appDialog: Get.find(),
        menuComponentController: Get.find(),
        iListDashboardUseCase: Get.find(),
      ),
    );
  }
}
