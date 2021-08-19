import 'package:dartz/dartz.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../external/i_login_external.dart';

class LoginRepository implements ILoginRepository {
  final ILoginExternal iLoginExternal;

  LoginRepository({
    required this.iLoginExternal,
  });

  @override
  Future<Either<Failure, TokenEntity>> login(LoginModel login) async {
    try {
      return Right(await iLoginExternal.login(login));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
