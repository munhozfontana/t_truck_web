import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/repositories/i_image_quality_detail_repository.dart';

import 'protocols/i_image_quality_case.dart';

class ImageQualityCase implements IImageQualityCase {
  IImageQualityDetailRepository iImageQualityDetailRepository;

  ImageQualityCase({
    required this.iImageQualityDetailRepository,
  });

  @override
  Future<Either<Failure, List<String>>> call(Params param) {
    return iImageQualityDetailRepository
        .getImageBtTruckDriverImage(param.truckDriverImageModel!);
  }
}
