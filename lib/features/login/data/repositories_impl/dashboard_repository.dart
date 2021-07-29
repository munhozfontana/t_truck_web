import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/login/data/external/i_login_external.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  final ILoginExternal iLoginExternal;

  LoginRepository({
    required this.iLoginExternal,
  });

  @override
  Future<Either<Failure, void>> login() async {
    try {
      return Right(await iLoginExternal.login());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
