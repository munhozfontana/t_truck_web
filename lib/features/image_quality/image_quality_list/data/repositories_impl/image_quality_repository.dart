import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/data/external/protocols/i_image_quality_external.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/entities/image_quality_entity.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/domain/repositories/i_image_quality_repository.dart';

class ImageQualityRepository implements IImageQualityRepository {
  final IImageQualityExternal iImageQualityExternal;

  ImageQualityRepository({
    required this.iImageQualityExternal,
  });

  @override
  Future<Either<Failure, List<ImageQualityEntity>>> get() async {
    try {
      return Right(await iImageQualityExternal.get());
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
