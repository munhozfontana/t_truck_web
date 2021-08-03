import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../entities/dash_board_entity.dart';
import '../repositories/i_dashboard_repository.dart';

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
