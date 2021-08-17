import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/src/interceptor.dart';
import 'package:t_truck_web/core/interceptors/protocol_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';

class LoadInterceptor implements IProtocolInterceptor {
  final StoreController storeController;
  int count = 0;

  LoadInterceptor({required this.storeController});

  @override
  InterceptorsWrapper call() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      count++;
      storeController.onLoad();
      return handler.next(options);
    }, onResponse: (response, handler) {
      count--;
      if (count == 0) {
        Timer(const Duration(milliseconds: 400), storeController.offLoad);
      }
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      storeController.offLoad();
    });
  }
}
