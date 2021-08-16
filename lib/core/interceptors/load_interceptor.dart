import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/src/interceptor.dart';
import 'package:t_truck_web/core/interceptors/protocol_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';

class LoadInterceptor implements IProtocolInterceptor {
  final StoreController storeController;

  LoadInterceptor({required this.storeController});

  @override
  InterceptorsWrapper call() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      storeController.onLoad();
      return handler.next(options);
    }, onResponse: (response, handler) {
      Timer(const Duration(seconds: 2), storeController.offLoad);
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      storeController.offLoad();
    });
  }
}
