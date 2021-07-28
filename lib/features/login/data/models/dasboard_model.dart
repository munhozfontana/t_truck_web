import 'package:t_truck_web/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required String login,
    required String password,
  }) : super(
          login: login,
          password: password,
        );
}
