import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

abstract class IListTruckDriversCase {
  Future<Either<Failure, List<TruckDriversEntity>>> call(Params params);
}
