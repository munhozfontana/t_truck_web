abstract class IHttp {
  Future<HttpResponse> getHttp(
    String? url, {
    Map<String, String>? headers,
  });
  Future<HttpResponse> putHttp(
    String? url, {
    Map<String, String>? headers,
    dynamic body,
  });
  Future<HttpResponse> postHttp(
    String? url, {
    Map<String, String>? headers,
    dynamic body,
  });
  Future<HttpResponse> deleteHttp(
    String? url, {
    Map<String, String>? headers,
  });
}

class HttpResponse {
  int? statusCode;
  String? body;
  Map? header;

  HttpResponse({
    this.statusCode,
    this.body,
    this.header,
  });
}
