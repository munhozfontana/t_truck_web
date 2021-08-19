import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';

abstract class IListLocationCase {
  Future<Either<Failure, List<LocationEntity>>> call(Params params);
}
