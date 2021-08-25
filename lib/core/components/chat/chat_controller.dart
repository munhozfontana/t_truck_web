import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ChatController extends GetxController {
  final RxDouble maxHeight = (330 * 1.4).obs;
  final RxDouble minHeight = (330 * 1.2).obs;

  RxBool visibleChatTalkComponent = false.obs;
  void closeTab() => visibleChatTalkComponent.value = false;
  void openTab() => visibleChatTalkComponent.value = true;

  RxBool chat = false.obs;
  void openChat() => chat.value = true;
  void closeChat() => chat.value = false;
}
