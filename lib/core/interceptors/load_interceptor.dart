import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/interceptors/protocol_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';

class LoadInterceptor implements IProtocolInterceptor {
  final StoreController storeController;

  LoadInterceptor({required this.storeController});

  @override
  InterceptorsWrapper call() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (!options.path.contains("api/location") &&
            !options.path.contains("api/imagemMotorista/imagem")) {
          storeController.onLoad();
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        Timer(const Duration(milliseconds: 400), storeController.offLoad);
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        try {
          if ((e.response?.data as Map)['error'] != null) {
            AppDialog()
                .error(menssagem: (e.response?.data as Map)['error'] as String);
          } else {
            AppDialog().error(menssagem: "Erro ao acessar prosseguir");
          }
        } catch (e) {
          AppDialog().error(menssagem: "Erro ao acessar prosseguir");
        }

        storeController.offLoad();
        Logger().e(e);
        throw ApiException(error: e.message);
      },
    );
  }
}
