import 'package:dartz/dartz.dart';

import '../../../../core/adapters/map/map_entity.dart';
import '../../../../core/error/failures.dart';

mixin IMapRepository {
  Either<Failure, MapEntity> init();
}
