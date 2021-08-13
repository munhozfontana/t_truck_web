import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

mixin ILoginCase {
  Future<Either<Failure, TokenEntity>> call(Params params);
}
