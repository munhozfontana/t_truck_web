import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/repositories/i_truck_drivers_details_repository.dart';

import 'protocols/i_list_truck_details_orders_case.dart';

class ListTruckDetailsOrdersCase implements IListTruckDetailsOrdersCase {
  ITruckDriversDetailsRepository iTruckDriversDetailsRepository;

  ListTruckDetailsOrdersCase({
    required this.iTruckDriversDetailsRepository,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> call(Params params) {
    return iTruckDriversDetailsRepository.getById(params.id!);
  }
}
