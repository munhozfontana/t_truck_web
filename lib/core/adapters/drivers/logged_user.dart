import 'package:t_truck_web/core/adapters/protocols/i_jwt_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_local_store_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/error/driver_exception.dart';

class LoggedUser implements ILoggedUser {
  final IJwt iJwt;
  final ILocalStoreExternal iLocalStoreExternal;

  LoggedUser({
    required this.iJwt,
    required this.iLocalStoreExternal,
  });

  @override
  Future<String> get login async {
    final token = await iLocalStoreExternal.take('token');
    if (token == null) {
      return '';
    }
    return iJwt.jwtDecode(token as String)['login'] as String;
  }

  @override
  Future<bool> loginExpired() async {
    try {
      final token = await iLocalStoreExternal.take('token');

      if (token == null) {
        return true;
      }

      final expired = iJwt.isExpired(token as String);
      if (expired) {
        await iLocalStoreExternal.remove('token');
      }
      return expired;
    } catch (e) {
      throw DriverException(error: e.toString());
    }
  }

  @override
  void logout() {
    try {
      iLocalStoreExternal.remove('token');
    } catch (e) {
      throw DriverException(error: 'Error ao remover o token');
    }
  }

  @override
  Future<String> get token async {
    try {
      final res = await iLocalStoreExternal.take("token");
      if (res == null) {
        return '';
      }
      return res as String;
    } catch (e) {
      throw DriverException(error: 'Error ao recuperar o token');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await iLocalStoreExternal.save('token', token);
    } catch (e) {
      throw DriverException(error: 'Error ao recuperar o token');
    }
  }
}
