import 'package:dio/dio.dart';

mixin IProtocolInterceptor {
  InterceptorsWrapper call();
}
