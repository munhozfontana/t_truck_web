import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';

mixin ILoginRepository {
  Future<Either<Failure, void>> login();
}
