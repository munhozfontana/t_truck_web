import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/repositories/i_truck_drivers_repository.dart';

import 'protocols/i_list_truck_drivers_case.dart';

class ListTruckDriversCase implements IListTruckDriversCase {
  ITruckDriversRepository iTruckDriversRepository;

  ListTruckDriversCase({
    required this.iTruckDriversRepository,
  });

  @override
  Future<Either<Failure, List<TruckDriversEntity>>> call(Params params) {
    return iTruckDriversRepository.get();
  }
}
