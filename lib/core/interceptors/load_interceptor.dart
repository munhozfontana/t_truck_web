import 'package:dio/dio.dart';
import 'package:t_truck_web/core/store_controller.dart';

class LoadInterceptor {
  final StoreController storeController;

  LoadInterceptor({required this.storeController});

  InterceptorsWrapper loadInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      storeController.onLoad();
      return handler.next(options);
    }, onResponse: (response, handler) {
      storeController.offLoad();
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      storeController.offLoad();
    });
  }
}
