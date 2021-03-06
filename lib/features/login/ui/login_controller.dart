import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';
import 'package:t_truck_web/features/login/data/models/dasboard_model.dart';
import 'package:t_truck_web/features/login/domain/use_cases/login_case.dart';

class LoginController extends GetxController {
  final LoginCase loginCase;
  final ILoggedUser iLoggedUser;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  final loginField = TextEditingController().obs;
  final passwordField = TextEditingController().obs;

  LoginController({
    required this.loginCase,
    required this.iLoggedUser,
  });

  @override
  void onInit() {
    super.onInit();
    redirectWhenLoginNotExpired();
  }

  Future<void> redirectWhenLoginNotExpired() async {
    if (!(await iLoggedUser.loginExpired())) {
      Get.offNamed('/home');
    }
  }

  Future<void> login() async {
    if (formKey.value.currentState!.validate()) {
      final loginModel = LoginModel(
        login: loginField.value.text,
        password: passwordField.value.text,
      );
      (await loginCase(Params(loginParam: loginModel))).fold(
        (l) => null,
        (r) async {
          iLoggedUser.saveToken(r.token);
          try {
            Get.find<HomeController>().getPanelData();
          } catch (e) {
            Logger().i('With no bigind');
          }
          Get.offNamed('/home');
        },
      );
    }
  }
}
