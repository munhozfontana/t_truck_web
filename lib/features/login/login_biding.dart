import 'package:get/get.dart';
import 'package:t_truck_web/features/login/data/external/i_login_external.dart';
import 'package:t_truck_web/features/login/data/repositories_impl/dashboard_repository.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_login_repository.dart';
import 'package:t_truck_web/features/login/domain/use_cases/login_case.dart';
import 'package:t_truck_web/features/login/ui/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginExternal>(
      () => LoginExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<ILoginRepository>(
      () => LoginRepository(
        iLoginExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginCase(
        iLoginRepository: Get.find(),
      ),
    );

    Get.put<LoginController>(
      LoginController(loginCase: Get.find()),
    );
  }
}
