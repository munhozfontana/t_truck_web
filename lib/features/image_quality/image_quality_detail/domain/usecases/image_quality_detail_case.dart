import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/repositories/i_image_quality_detail_repository.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/usecases/protocols/i_image_quality_detail_case.dart';

class ImageQualityDetailCase implements IDetailImageQualityCase {
  IImageQualityDetailRepository iImageQualityDetailRepository;

  ImageQualityDetailCase({
    required this.iImageQualityDetailRepository,
  });

  @override
  Future<Either<Failure, List<TruckDriverImageModel>>> call(Params param) {
    return iImageQualityDetailRepository.getById(param.id!);
  }
}
