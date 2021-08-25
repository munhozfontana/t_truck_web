import 'package:get/get.dart';

class StoreController extends GetxController {
  RxBool loading = true.obs;
  void onLoad() => loading.value = true;
  void offLoad() => loading.value = false;

  RxBool chat = false.obs;
  void openChat() => chat.value = true;
  void closeChat() => chat.value = false;
}
