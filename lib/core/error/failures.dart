import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? detail;

  const Failure({this.detail});
}

// General failures
class AppFailure extends Failure {
  @override
  final String? detail;

  const AppFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}

class RequestFailure extends Failure {
  @override
  final String? detail;

  const RequestFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}

class DriverFailure extends Failure {
  @override
  final String? detail;

  const DriverFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}

class ValidationFailure extends Failure {
  @override
  final String? detail;

  const ValidationFailure({this.detail});

  @override
  List<Object?> get props => [detail];
}
