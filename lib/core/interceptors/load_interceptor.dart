import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/interceptors/protocol_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';

class LoadInterceptor implements IProtocolInterceptor {
  final StoreController storeController;

  LoadInterceptor({required this.storeController});

  @override
  InterceptorsWrapper call() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      if (!options.path.contains("api/location")) {
        storeController.onLoad();
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      Timer(const Duration(milliseconds: 400), storeController.offLoad);
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      storeController.offLoad();
      Logger().e(e);
      throw ApiException(error: e.message);
    });
  }
}
