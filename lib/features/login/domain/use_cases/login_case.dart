import 'package:dartz/dartz.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';
import 'package:t_truck_web/features/login/domain/use_cases/protocols/i_login_case.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../repositories/i_login_repository.dart';

class LoginCase implements ILoginCase {
  ILoginRepository iLoginRepository;

  LoginCase({
    required this.iLoginRepository,
  });

  @override
  Future<Either<Failure, TokenEntity>> call(Params params) async {
    return iLoginRepository.login(params.loginParam!);
  }
}
