import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_dashboard_repository.dart';

abstract class IListDashboardUseCase {
  Future<Either<Failure, List<DashBoardEntity>>> call(Params params);
}

class ListDashboardUseCase implements IListDashboardUseCase {
  IDasboadRepository iDasboadRepository;

  ListDashboardUseCase({
    required this.iDasboadRepository,
  });

  @override
  Future<Either<Failure, List<DashBoardEntity>>> call(Params params) {
    return iDasboadRepository.get();
  }
}