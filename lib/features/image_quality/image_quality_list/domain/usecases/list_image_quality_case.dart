import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/repositories/i_image_quality_repository.dart';

import 'protocols/i_list_image_quality_case.dart';

class ListImageQualityCase implements IListImageQualityCase {
  IImageQualityRepository iImageQualityRepository;

  ListImageQualityCase({
    required this.iImageQualityRepository,
  });

  @override
  Future<Either<Failure, List<ImageQualityEntity>>> call(Params params) {
    return iImageQualityRepository.get();
  }
}
