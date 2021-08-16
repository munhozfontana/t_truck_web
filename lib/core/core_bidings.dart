import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/interceptors/app_interceptor.dart';

import 'adapters/drivers/dio_driver.dart';
import 'adapters/protocols/i_http_external.dart';
import 'components/menu/menu_component_controller.dart';
import 'utils/app_dialog.dart';

class CoreBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAppDialog>(
      () => AppDialog(),
    );
    Get.lazyPut<IMenuComponentController>(
      () => MenuComponentController(),
    );
    Get.lazyPut<IHttp>(
      () => DioDriver(
        interceptors:
            AppInterceptor(storeController: Get.find()).allInterceptor(),
        dio: Dio(BaseOptions(
          connectTimeout:
              const Duration(seconds: 5).inMilliseconds, // 60 seconds
          receiveTimeout:
              const Duration(seconds: 5).inMilliseconds, // 60 seconds
        )),
      ),
    );
  }
}
