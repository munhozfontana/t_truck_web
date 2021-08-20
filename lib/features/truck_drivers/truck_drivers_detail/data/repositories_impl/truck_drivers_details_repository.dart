import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/data/external/protocols/i_truck_drivers_details_external.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';

import '../../domain/repositories/i_truck_drivers_details_repository.dart';

class TruckDriversDetailsRepository implements ITruckDriversDetailsRepository {
  ITruckDriversDetailsExternal iTruckDriversDetailsExternal;

  TruckDriversDetailsRepository({
    required this.iTruckDriversDetailsExternal,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> getById(int codMot) async {
    try {
      return Right(await iTruckDriversDetailsExternal.getById(codMot));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
