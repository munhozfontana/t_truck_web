import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/interceptors/load_interceptor.dart';
import 'package:t_truck_web/core/interceptors/token_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';

class AppInterceptor {
  final StoreController storeController;

  AppInterceptor({required this.storeController});

  List<InterceptorsWrapper> allInterceptor() {
    return [
      LoadInterceptor(storeController: storeController)(),
      TokenInterceptor(
        storeController: storeController,
        iLoggedUserl: Get.find(),
      )(),
    ];
  }
}
