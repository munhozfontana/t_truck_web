import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';

abstract class IDevolutionRepository {
  Future<Either<Failure, List<DevolutionEntity>>> get();
}
