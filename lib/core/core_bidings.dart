import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'adapters/drivers/dio_driver.dart';
import 'adapters/protocols/i_http_external.dart';
import 'components/menu/menu_component_controller.dart';
import 'utils/app_dialog.dart';

class CoreBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAppDialog>(
      AppDialog(),
      permanent: true,
    );
    Get.put<IMenuComponentController>(
      MenuComponentController(),
      permanent: true,
    );
    Get.put<IHttp>(
      DioDriver(
        iLoggedUser: Get.find(),
        dio: Dio(BaseOptions(
            connectTimeout: 15 * 1000, // 60 seconds
            receiveTimeout: 15 * 1000 // 60 seconds
            )),
      ),
      permanent: true,
    );
  }
}
