import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';

abstract class IConfigRepository {
  Future<Either<Failure, void>> save(ConfigEntity obj);
}
