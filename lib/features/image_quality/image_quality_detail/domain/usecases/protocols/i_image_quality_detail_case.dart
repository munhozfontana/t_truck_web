import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/entities/truck_driver_image_entity.dart';

abstract class IDetailImageQualityCase {
  Future<Either<Failure, List<TruckDriverImageEntity>>> call(Params param);
}
