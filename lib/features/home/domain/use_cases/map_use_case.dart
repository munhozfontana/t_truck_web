import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/params/params.dart';
import '../../../../../../core/use_case.dart';
import '../../../../core/adapters/map/map_entity.dart';
import '../repositories/i_map_repository.dart';

class MapUseCase implements UseCase<Type, Params> {
  final IMapRepository iMapRepository;

  MapUseCase({
    required this.iMapRepository,
  });

  @override
  Either<Failure, MapEntity> call(Params params) {
    return iMapRepository.init();
  }
}
