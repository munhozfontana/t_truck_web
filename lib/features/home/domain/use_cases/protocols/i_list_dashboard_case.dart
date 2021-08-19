import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';

abstract class IListDashboardCase {
  Future<Either<Failure, DashBoardComposedEntity>> call(Params params);
}
