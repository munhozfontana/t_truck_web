import 'package:dartz/dartz.dart';

import 'error/failures.dart';

abstract class UseCaseAsync<Type, Params> {
  Future<Either<Failure, void>> call(Params params);
}

abstract class UseCase<Type, Params> {
  Either<Failure, void> call(Params params);
}
