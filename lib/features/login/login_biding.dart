import 'package:get/get.dart';
import 'package:t_truck_web/features/login/ui/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
    );
  }
}
