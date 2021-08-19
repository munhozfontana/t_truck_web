import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/dash_board_entity.dart';

mixin IDasboadRepository {
  Future<Either<Failure, DashBoardComposedEntity>> get();
}
