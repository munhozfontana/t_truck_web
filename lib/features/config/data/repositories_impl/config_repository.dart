import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/features/config/domain/entities/config_entity.dart';
import 'package:t_truck_web/features/config/domain/repositories/i_config_repository.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../external/protocols/i_config_external.dart';

class ConfigRepository implements IConfigRepository {
  final IConfigExternal iConfigExternal;

  ConfigRepository({
    required this.iConfigExternal,
  });

  @override
  Future<Either<Failure, void>> save(ConfigEntity obj) async {
    try {
      return Right(await iConfigExternal.save(obj));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
