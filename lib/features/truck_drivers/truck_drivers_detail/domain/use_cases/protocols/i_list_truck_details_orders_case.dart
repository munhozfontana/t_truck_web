import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';

abstract class IListTruckDetailsOrdersCase {
  Future<Either<Failure, List<OrderEntity>>> call(Params params);
}
