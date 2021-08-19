import 'package:get/get.dart';
import 'package:t_truck_web/core/core_bidings.dart';
import 'package:t_truck_web/core/interceptors/app_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';
import 'package:t_truck_web/features/login/login_biding.dart';
import 'package:t_truck_web/features/login/token_biding.dart';

class MainBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
    TokenBiding().dependencies();
    CoreBiding().dependencies();
    LoginBiding().dependencies();
    Get.lazyPut(
      () => AppInterceptor(
        storeController: Get.find(),
      ),
    );
  }
}
