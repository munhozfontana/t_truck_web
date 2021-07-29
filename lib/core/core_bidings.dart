import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';

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
        dio: Dio(BaseOptions(
            connectTimeout: 15 * 1000, // 60 seconds
            receiveTimeout: 15 * 1000 // 60 seconds
            )),
      ),
      permanent: true,
    );
  }
}
