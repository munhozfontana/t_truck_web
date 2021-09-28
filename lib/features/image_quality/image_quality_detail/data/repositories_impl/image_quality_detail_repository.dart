import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/external/protocols/i_image_quality_detail_external.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/data/models/truck_driver_image_model.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/domain/repositories/i_image_quality_detail_repository.dart';

class ImageQualityDetailRepository implements IImageQualityDetailRepository {
  final IImageQualityDetailExternal iImageQualityDetailExternal;

  ImageQualityDetailRepository({
    required this.iImageQualityDetailExternal,
  });

  @override
  Future<Either<Failure, List<TruckDriverImageModel>>> getById(int cod) async {
    try {
      return Right(await iImageQualityDetailExternal.getById(cod));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getImageBtTruckDriverImage(
      TruckDriverImageModel truckDriverImageModel) async {
    try {
      return Right(await iImageQualityDetailExternal
          .getImageBtTruckDriverImage(truckDriverImageModel));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
