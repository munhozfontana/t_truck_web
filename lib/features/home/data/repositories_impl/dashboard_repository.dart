import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/dash_board_entity.dart';
import '../../domain/repositories/i_dashboard_repository.dart';
import '../external/protocols/i_dashboard_external.dart';

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
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
