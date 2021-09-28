import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';

abstract class IImageQualityCase {
  Future<Either<Failure, List<String>>> call(
    Params param,
  );
}
