import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_dashboard_repository.dart';

abstract class IListDashboardCase {
  Future<Either<Failure, DashBoardComposedEntity>> call(Params params);
}

class ListDashboardCase implements IListDashboardCase {
  IDasboadRepository iDasboadRepository;

  ListDashboardCase({
    required this.iDasboadRepository,
  });

  @override
  Future<Either<Failure, DashBoardComposedEntity>> call(Params params) {
    return iDasboadRepository.get();
  }
}
