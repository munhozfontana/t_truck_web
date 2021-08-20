import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/data/external/protocols/i_truck_drivers_external.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

import '../../domain/repositories/i_truck_drivers_repository.dart';

class TruckDriversRepository implements ITruckDriversRepository {
  final ITruckDriversExternal iTruckDriversExternal;

  TruckDriversRepository({
    required this.iTruckDriversExternal,
  });

  @override
  Future<Either<Failure, List<TruckDriversEntity>>> get() async {
    try {
      return Right(await iTruckDriversExternal.get());
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
