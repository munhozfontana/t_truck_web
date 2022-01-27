import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/external/protocols/i_devolution_detail_external.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/models/products_model.dart';

import './i_devolution_detail_repository.dart';

class DevolutionDetailRepository implements IDevolutionDetailRepository {
  final IDevolutionDetailExternal iDevolutionDetailExternal;

  DevolutionDetailRepository({
    required this.iDevolutionDetailExternal,
  });

  @override
  Future<Either<Failure, List<ProductsModel>>> getById(int cod) async {
    try {
      return Right(await iDevolutionDetailExternal.getById(cod));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
