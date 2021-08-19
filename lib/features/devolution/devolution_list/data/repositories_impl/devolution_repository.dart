import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/external/protocols/i_devolution_external.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/repositories/i_devolution_repository.dart';

class DevolutionRepository implements IDevolutionRepository {
  final IDevolutionExternal iDevolutionExternal;

  DevolutionRepository({
    required this.iDevolutionExternal,
  });

  @override
  Future<Either<Failure, List<DevolutionEntity>>> get() async {
    try {
      return Right(await iDevolutionExternal.get());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
