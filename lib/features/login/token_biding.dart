import 'package:get/get.dart';
import 'package:t_truck_web/features/login/data/repositories_impl/token_repository.dart';
import 'package:t_truck_web/features/login/domain/repositories/i_token_repository.dart';
import 'package:t_truck_web/features/login/domain/use_cases/token_use_case.dart';

class TokenBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ITokenRepository>(
      () => TokenRepository(jwtDriver: Get.find()),
    );

    Get.lazyPut<TokenUseCase>(
      () => TokenUseCase(tokenRepository: Get.find()),
    );
  }
}
