import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';

abstract class IImageQualityDetailRepository {
  Future<Either<Failure, List<TruckDriverImageModel>>> getById(int cod);
}
