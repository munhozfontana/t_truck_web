import 'package:dartz/dartz.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

import '../../../../core/error/failures.dart';

mixin ILoginRepository {
  Future<Either<Failure, TokenEntity>> login(LoginModel login);
}
