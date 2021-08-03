import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

import '../../../features/login/login_biding.dart';
import '../../../features/login/ui/login_page.dart';
import '../protocols/i_http_external.dart';

class DioDriver implements IHttp {
  final Dio dio;
  // final ILoggedUser iLoggedUser;

  DioDriver({
    required this.dio,
    // required this.iLoggedUser,
  });

  @override
  Future<HttpResponse> deleteHttp(
    String? url, {
    Map<String, String>? headers,
  }) async {
    return mackObj(
        await dio.delete(url!, options: await buildOptions(headers)));
  }

  @override
  Future<HttpResponse> getHttp(
    String? url, {
    Map<String, String>? headers,
  }) async {
    return mackObj(await dio.get(url!, options: await buildOptions(headers)));
  }

  @override
  Future<HttpResponse> postHttp(
    String? url, {
    Map<String, String>? headers,
    body,
  }) async {
    return mackObj(
        await dio.post(url!, data: body, options: await buildOptions(headers)));
  }

  @override
  Future<HttpResponse> putHttp(
    String? url, {
    Map<String, String>? headers,
    body,
  }) async {
    return mackObj(await dio.put(url!, options: await buildOptions(headers)));
  }

  Future<Options> buildOptions(Map<String, String>? headersParam) async {
    String token;

    try {
      // token = await iLoggedUser.token;
    } catch (e) {
      token = '';
    }

    final headers = {'x-access-token': ''};

    if (headersParam != null) {
      headers.addAll(headersParam);
    }

    return Options(headers: headers);
  }

  Future<void> logautWhenUnautorized(DioError e) async {
    if (e.response != null && e.response!.statusCode == 401) {
      await Get.offAll(const LoginPage(), binding: LoginBiding());
    }
  }

  HttpResponse mackObj(Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: jsonEncode(response.data),
      header: response.requestOptions.headers,
    );
  }
}
