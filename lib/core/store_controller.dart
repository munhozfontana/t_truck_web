import 'package:get/get.dart';

class StoreController extends GetxController {
  RxBool loading = false.obs;
  void onLoad() => loading.value = true;
  void offLoad() => loading.value = false;
}
