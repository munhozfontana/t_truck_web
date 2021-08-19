import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ITokenRepository {
  Either<Failure, Map> jwtDecode(String token);
  Either<Failure, bool> expired(String token);
}
