import 'package:t_truck_web/core/adapters/drivers/dio_driver.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/entities/token_entity.dart';

import '../../../../core/adapters/protocols/i_http_external.dart';
import '../../../../core/error/api_exception.dart';

mixin ILoginExternal {
  Future<TokenEntity> login(LoginModel login);
}

class LoginExternal implements ILoginExternal {
  IHttp iHttp;

  LoginExternal({
    required this.iHttp,
  });

  @override
  Future<TokenEntity> login(LoginModel login) async {
    try {
      final res = await iHttp.postHttp(
        'http://truck.stoatacadista.com.br:2302/api/login',
        body: login.toJson(),
      );
      return TokenEntity.fromMap(DioDriver.bodyExtract(res));
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
