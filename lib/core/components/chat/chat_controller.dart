import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_truck_web/core/components/chat/models/chat_message.dart';

class ChatController extends GetxController {
  final RxDouble maxHeight = (330 * 1.4).obs;
  final RxDouble minHeight = (330 * 1.2).obs;

  RxBool visibleChatTalkComponent = false.obs;
  void closeTab() => visibleChatTalkComponent.value = false;
  void openTab() => visibleChatTalkComponent.value = true;

  RxBool chat = false.obs;
  void openChat() => chat.value = true;
  void closeChat() => chat.value = false;

  RxList<ChatMessage> listChatMessage = <ChatMessage>[
    ...List.generate(
        20,
        (index) => ChatMessage(
              avatar: Text(tratarNome(Faker().person.name())),
              id: index,
              title: Faker().person.firstName(),
              subtitle: Faker().internet.ipv4Address(),
            ))
  ].obs;

  Rx<ChatMessage> selectChat =
      ChatMessage(id: 0, avatar: Text(""), title: "", subtitle: "").obs;

  void onSelect(int index) {
    selectChat.value = listChatMessage[index];
    openTab();
  }
}

String tratarNome(String name) {
  final iniciais = name
      .trim()
      .replaceAll(new RegExp(r'[^\w\s]+'), '')
      .split(" ")
      .map((e) => e[0])
      .join()
      .toUpperCase();

  return iniciais[0] +
      (iniciais.length > 1 ? iniciais[iniciais.length - 1] : "");
}
