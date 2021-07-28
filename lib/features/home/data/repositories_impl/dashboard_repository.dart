import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/home/data/external/i_dashboard.dart';
import 'package:t_truck_web/features/home/domain/entities/dash_board_entity.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_dashboard_repository.dart';

class DasboadRepository implements IDasboadRepository {
  final IDashboardExternal iDashboardExternal;

  DasboadRepository({
    required this.iDashboardExternal,
  });

  @override
  Future<Either<Failure, DashBoardComposedEntity>> get() async {
    try {
      return Right(await iDashboardExternal.get());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
