import 'package:t_truck_web/core/adapters/protocols/i_http_external.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/login/domain/entities/login_entity.dart';

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
