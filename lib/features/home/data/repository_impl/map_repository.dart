import 'package:dartz/dartz.dart';

import '../../../../core/adapters/map/i_map_adp.dart';
import '../../../../core/adapters/map/map_entity.dart';
import '../../../../core/error/driver_exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/i_map_repository.dart';

@override
class MapRepository implements IMapRepository {
  IMapAdp iMap;

  MapRepository({
    required this.iMap,
  });

  @override
  Either<Failure, MapEntity> init() {
    try {
      return Right(iMap.init());
    } on DriverException catch (e) {
      return Left(DriverFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao acessa o mapa'));
    }
  }
}
