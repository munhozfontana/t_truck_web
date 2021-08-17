import 'package:dartz/dartz.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_dashboard_case.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../entities/dash_board_entity.dart';
import '../repositories/i_dashboard_repository.dart';

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
