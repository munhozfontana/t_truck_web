import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_location_repository.dart';

import 'protocols/i_list_location_case.dart';

class ListLocationCase implements IListLocationCase {
  ILocationRepository iLocationRepository;

  ListLocationCase({
    required this.iLocationRepository,
  });

  @override
  Future<Either<Failure, List<LocationEntity>>> call(Params params) {
    return iLocationRepository.get();
  }
}
