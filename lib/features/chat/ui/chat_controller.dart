import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_person_entity.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/protocols/i_list_chat_people_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/protocols/i_receive_chat_message_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/protocols/i_send_chat_message_case.dart';

class ChatController extends GetxController {
  ISendChatMessageCase iSendChatMessageCase;
  IReceiveChatMessageCase iReceiveChatMessageCase;
  IListChatPeopleCase iListChatPeopleCase;

  // Variables
  RxList<ChatPerson> listChatMessage = <ChatPerson>[].obs;
  Rx<ScrollController> listViewConMessages = ScrollController().obs;

  RxBool visibleChatTalkComponent = false.obs;
  RxBool chat = false.obs;

  ChatController({
    required this.iSendChatMessageCase,
    required this.iReceiveChatMessageCase,
    required this.iListChatPeopleCase,
  });

  TextEditingController textSendMessage = TextEditingController();

  Rx<ChatPerson> selectChat = ChatPerson(
    id: 0,
    avatar: Text(""),
    title: "",
    subtitle: "",
    messages: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();

    onReceiveMessage();
    getInitialData();
  }

  getInitialData() async {
    (await iListChatPeopleCase(Params())).fold(
      (l) => null,
      (r) => {listChatMessage.value = r},
    );
  }

// --------------------------
  Future<void> onSendMessage() async {
    iSendChatMessageCase(
      Params(
        chatMessageEntity: ChatMessage(
          content: textSendMessage.text,
          codSender: int.parse(await Get.find<ILoggedUser>().login),
          createAt: DateTime.now(),
        ),
      ),
    );
  }

  void onReceiveMessage() {
    iReceiveChatMessageCase(const Params()).fold(
      (l) => null,
      (r) => {
        r.listen((data) {
          selectChat.value.messages.add(data);
          selectChat.refresh();
          Timer(const Duration(milliseconds: 100), rowDown);
        })
      },
    );
  }
// --------------------------

  void onSelect(int index) {
    selectChat.value = listChatMessage[index];

    selectChat.value.messages;
    openTab();

    Timer(Duration(milliseconds: 200), rowDown);
  }

  bool isUserTalk(int index) {
    return selectChat.value.messages[index].codSender == 355911;
  }

  void rowDown() {
    listViewConMessages.value.position.animateTo(
      listViewConMessages.value.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeOutSine,
    );
  }

  void closeTab() => visibleChatTalkComponent.value = false;
  void openTab() => visibleChatTalkComponent.value = true;
  void openChat() => chat.value = true;
  void closeChat() => chat.value = false;

  // Styles
  final edgeInsets = const EdgeInsets.only(
    top: 14,
    left: 16,
    right: 16,
    bottom: 14,
  );

  final boxDecoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(22),
      topRight: Radius.circular(22),
    ),
  );

  final RxDouble maxHeight = (330 * 1.4).obs;
  final RxDouble minHeight = (330 * 1.2).obs;
}
