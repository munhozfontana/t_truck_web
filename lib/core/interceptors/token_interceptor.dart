import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/interceptors/protocol_interceptor.dart';
import 'package:t_truck_web/core/store_controller.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class TokenInterceptor implements IProtocolInterceptor {
  final StoreController storeController;
  final ILoggedUser iLoggedUserl;

  TokenInterceptor({required this.storeController, required this.iLoggedUserl});

  @override
  InterceptorsWrapper call() {
    return InterceptorsWrapper(onRequest: (options, handler) async {
      if (Get.currentRoute != Routes.login.path) {
        try {
          final token = await iLoggedUserl.token;
          if (token.isBlank ?? false || await iLoggedUserl.loginExpired()) {
            Get.toNamed(Routes.login.path);
          }
          options.headers.addAll({'x-access-token': token});
        } catch (e) {
          log('Sem token de acesso');
        }
      }

      storeController.onLoad();
      return handler.next(options);
    });
  }
}
