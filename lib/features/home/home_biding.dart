import 'package:get/get.dart';

import 'data/external/i_dashboard_external.dart';
import 'data/repositories_impl/dashboard_repository.dart';
import 'domain/repositories/i_dashboard_repository.dart';
import 'domain/use_cases/list_dashboard_case.dart';
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

    Get.lazyPut<IListDashboardCase>(
      () => ListDashboardCase(
        iDasboadRepository: Get.find(),
      ),
    );

    Get.put<HomeController>(
      HomeController(
        appDialog: Get.find(),
        menuComponentController: Get.find(),
        iListDashboardCase: Get.find(),
      ),
    );
  }
}
