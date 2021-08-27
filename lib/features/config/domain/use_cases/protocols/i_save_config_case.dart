import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';

abstract class ISaveConfigCase {
  Future<Either<Failure, void>> call(Params params);
}
