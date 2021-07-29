import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_login_repository.dart';

abstract class ILoginCase {
  Future<Either<Failure, void>> call(Params params);
}

class LoginCase implements ILoginCase {
  ILoginRepository iLoginRepository;

  LoginCase({
    required this.iLoginRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return iLoginRepository.login();
  }
}
