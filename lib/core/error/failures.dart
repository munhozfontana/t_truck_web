import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? detail;

  Failure({this.detail});
}

// General failures
class AppFailure extends Failure {
  final String? detail;

  AppFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}

class RequestFailure extends Failure {
  final String? detail;

  RequestFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}

class DriverFailure extends Failure {
  final String? detail;

  DriverFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}

class ValidationFailure extends Failure {
  final String? detail;

  ValidationFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}
