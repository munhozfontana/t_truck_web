import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

mixin ILoginRepository {
  Future<Either<Failure, void>> login();
}
