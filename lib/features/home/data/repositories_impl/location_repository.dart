import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/home/data/external/protocols/i_location_external.dart';
import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';

import '../../domain/repositories/i_location_repository.dart';

class LocationRepository implements ILocationRepository {
  final ILocationExternal iLocationExternal;

  LocationRepository({
    required this.iLocationExternal,
  });

  @override
  Future<Either<Failure, List<LocationEntity>>> get() async {
    try {
      return Right(await iLocationExternal.get());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
