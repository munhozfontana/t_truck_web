import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';

mixin IDasboadRepository {
  Future<Either<Failure, List<DashBoardEntity>>> get();
}

class DasboadRepository implements IDasboadRepository {
  @override
  Future<Either<Failure, List<DashBoardEntity>>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }
}
