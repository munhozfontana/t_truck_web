import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/external/protocols/i_devolution_external.dart';

import './i_devolution_detail_repository.dart';

class DevolutionDetailRepository implements IDevolutionDetailRepository {
  final IDevolutionExternal iDevolutionExternal;

  DevolutionDetailRepository({
    required this.iDevolutionExternal,
  });

  @override
  Future<Either<Failure, List<ProductsEntity>>> getById(int cod) async {
    try {
      return Right(await iDevolutionExternal.getById(cod));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
