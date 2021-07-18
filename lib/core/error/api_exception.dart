class ApiException implements Exception {
  final String? error;

  ApiException({this.error});
}

class ApiAdaptertException implements ApiException {
  @override
  final String? error;

  ApiAdaptertException({this.error});
}

class ApiNotExists implements ApiException {
  @override
  final String? error;

  ApiNotExists({this.error});
}
