import 'dart:developer';

class DriverException implements Exception {
  final String? error;

  DriverException({this.error}) {
    log(error ?? 'Erro não identificado');
  }
}
