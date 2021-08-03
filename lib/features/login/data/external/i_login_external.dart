import '../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../core/error/api_exception.dart';
import '../../domain/entities/login_entity.dart';

mixin ILoginExternal {
  Future<LoginEntity> login();
}

class LoginExternal implements ILoginExternal {
  IHttp iHttp;

  LoginExternal({
    required this.iHttp,
  });

  @override
  Future<LoginEntity> login() async {
    try {
      // var res = await iHttp.getHttp(
      //   '${dotenv.env['URL_BASE']}/Logins',
      // );

      return Future.value();
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
