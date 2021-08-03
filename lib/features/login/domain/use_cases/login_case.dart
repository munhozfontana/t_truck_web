import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../repositories/i_login_repository.dart';

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
