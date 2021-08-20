import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_token_repository.dart';

import '../../../../core/adapters/protocols/i_jwt_external.dart';
import '../../../../core/error/driver_exception.dart';
import '../../../../core/error/failures.dart';

class TokenRepository implements ITokenRepository {
  final IJwt jwtDriver;

  TokenRepository({required this.jwtDriver});

  @override
  Either<Failure, bool> expired(String token) {
    try {
      return Right(jwtDriver.isExpired(token));
    } on DriverException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(
        AppFailure(detail: 'Falha ao obter expiração do token'),
      );
    }
  }

  @override
  Either<Failure, Map> jwtDecode(token) {
    try {
      return Right(jwtDriver.jwtDecode(token));
    } on DriverException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(
        AppFailure(detail: 'Falha ao decodificar o token'),
      );
    }
  }
}
