import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/domain/entities/image_quality_entity.dart';

abstract class IListImageQualityCase {
  Future<Either<Failure, List<ImageQualityEntity>>> call(Params params);
}
