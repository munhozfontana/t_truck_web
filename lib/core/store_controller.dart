import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';

class StoreController extends GetxController {
  RxBool loading = false.obs;
  RxString nameUser = "".obs;
  void onLoad() => loading.value = true;
  void offLoad() => loading.value = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Get.find<ILoggedUser>().login.then((value) {
      nameUser.value = value;
    });
  }
}
