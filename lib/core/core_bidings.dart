import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/drivers/jwt_decoder_driver.dart';
import 'package:t_truck_web/core/adapters/drivers/logged_user.dart';
import 'package:t_truck_web/core/adapters/drivers/shared_preferences_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_jwt_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_local_store_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/interceptors/app_interceptor.dart';

import 'adapters/drivers/dio_driver.dart';
import 'adapters/protocols/i_http_external.dart';
import 'utils/app_dialog.dart';

class CoreBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAppDialog>(
      AppDialog(),
      permanent: true,
    );
    Get.lazyPut<IHttp>(
      () => DioDriver(
        interceptors:
            AppInterceptor(storeController: Get.find()).allInterceptor(),
        dio: Dio(
          BaseOptions(
            connectTimeout:
                const Duration(seconds: 5).inMilliseconds, // 60 seconds
            receiveTimeout:
                const Duration(seconds: 5).inMilliseconds, // 60 seconds
          ),
        ),
      ),
    );

    Get.lazyPut<ILocalStoreExternal>(
      () => SharedPreferencesDriver(),
    );

    Get.lazyPut<IJwt>(
      () => JwtDecoderDriver(),
    );

    Get.put<ILoggedUser>(
      LoggedUser(
        iJwt: Get.find(),
        iLocalStoreExternal: Get.find(),
      ),
      permanent: true,
    );
  }
}
