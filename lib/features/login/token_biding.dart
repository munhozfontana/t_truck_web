import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/drivers/jwt_decoder_driver.dart';
import 'package:t_truck_web/core/adapters/drivers/logged_user.dart';
import 'package:t_truck_web/core/adapters/drivers/shared_preferences_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_jwt_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_local_store_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/features/login/data/repositories_impl/token_repository.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_token_repository.dart';
import 'package:t_truck_web/features/login/domain/use_cases/token_use_case.dart';

class TokenBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalStoreExternal>(
      () => SharedPreferencesDriver(),
    );

    Get.lazyPut<IJwt>(
      () => JwtDecoderDriver(),
    );

    Get.lazyPut<ILoggedUser>(
      () => LoggedUser(
        iJwt: Get.find(),
        iLocalStoreExternal: Get.find(),
      ),
    );

    Get.lazyPut<ITokenRepository>(
      () => TokenRepository(jwtDriver: Get.find()),
    );

    Get.lazyPut<TokenUseCase>(
      () => TokenUseCase(tokenRepository: Get.find()),
    );
  }
}
