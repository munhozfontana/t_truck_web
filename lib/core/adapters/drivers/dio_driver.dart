import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

import '../../../features/login/login_biding.dart';
import '../../../features/login/ui/login_page.dart';
import '../protocols/i_http_external.dart';

class DioDriver implements IHttp {
  final Dio dio;

  final Iterable<Interceptor>? interceptors;

  DioDriver({
    required this.dio,
    this.interceptors,
  }) {
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors!);
    }
  }

  @override
  Future<HttpResponse> deleteHttp(
    String? url, {
    Map<String, String>? headers,
  }) async {
    return mackObj(await dio.delete(url!, options: Options(headers: headers)));
  }

  @override
  Future<HttpResponse> getHttp(
    String? url, {
    Map<String, String>? headers,
  }) async {
    return mackObj(await dio.get(url!, options: Options(headers: headers)));
  }

  @override
  Future<HttpResponse> postHttp(
    String? url, {
    Map<String, String>? headers,
    body,
  }) async {
    return mackObj(
        await dio.post(url!, data: body, options: Options(headers: headers)));
  }

  @override
  Future<HttpResponse> putHttp(
    String? url, {
    Map<String, String>? headers,
    body,
  }) async {
    return mackObj(await dio.put(url!, options: Options(headers: headers)));
  }

  Future<void> logautWhenUnautorized(DioError e) async {
    if (e.response != null && e.response!.statusCode == 401) {
      await Get.offAll(const LoginPage(), binding: LoginBiding());
    }
  }

  static Map<String, dynamic> bodyExtract(HttpResponse res) =>
      jsonDecode(res.body!) as Map<String, dynamic>;

  static List listExtract(HttpResponse res) => jsonDecode(res.body!) as List;

  HttpResponse mackObj(Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: jsonEncode(response.data),
      header: response.requestOptions.headers,
    );
  }
}
