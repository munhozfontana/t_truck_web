import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/use_cases/login_case.dart';

class LoginController extends GetxController {
  final LoginCase loginCase;
  final ILoggedUser iLoggedUser;

  final loginField = TextEditingController().obs;
  final passwordField = TextEditingController().obs;

  LoginController({
    required this.loginCase,
    required this.iLoggedUser,
  });

  void login() async {
    final loginModel = LoginModel(
      login: loginField.value.text,
      password: passwordField.value.text,
    );
    (await loginCase(Params(loginParam: loginModel))).fold(
      (l) => null,
      (r) {
        iLoggedUser.saveToken(r.token);
        Get.offNamed('/home');
      },
    );
  }
}
