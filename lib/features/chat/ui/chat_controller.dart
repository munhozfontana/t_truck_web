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
  // injects
  ISendChatMessageCase iSendChatMessageCase;
  IReceiveChatMessageCase iReceiveChatMessageCase;
  IListChatPeopleCase iListChatPeopleCase;
  ILoggedUser iLoggedUser;

  // Variables
  RxList<ChatPerson> listChatMessage = <ChatPerson>[].obs;
  Rx<ScrollController> listViewConMessages = ScrollController().obs;
  RxBool visibleChatTalkComponent = false.obs;
  RxBool chat = false.obs;
  RxInt login = 0.obs;

  ChatController({
    required this.iSendChatMessageCase,
    required this.iReceiveChatMessageCase,
    required this.iListChatPeopleCase,
    required this.iLoggedUser,
  });

  TextEditingController textSendMessage = TextEditingController();

  Rx<ChatPerson> selectChat = ChatPerson(
    id: 0,
    avatar: Text(""),
    name: "",
    codPerson: "",
    messages: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();

    chat.listen((value) {
      if (value) {
        getInitialData();
      }
    });
  }

  Future<void> getInitialData() async {
    final loginMaybeEmpty = await iLoggedUser.login;
    onReceiveMessage(loginMaybeEmpty);
    if (loginMaybeEmpty.isNotEmpty) {
      login.value = int.parse(loginMaybeEmpty);
      (await iListChatPeopleCase(Params(idUser: loginMaybeEmpty))).fold(
        (l) => null,
        (r) => {
          listChatMessage.value = r,
          listChatMessage.refresh(),
        },
      );
    }
  }

// --------------------------
  Future<void> onSendMessage() async {
    iSendChatMessageCase(
      Params(
        chatMessageEntity: ChatMessage(
          content: textSendMessage.text,
          codFrom: login.value,
          codTo: int.parse(selectChat.value.codPerson),
          createAt: DateTime.now(),
        ),
      ),
    );
  }

  void onReceiveMessage(String loginMaybeEmpty) {
    iReceiveChatMessageCase(Params(idUser: loginMaybeEmpty)).fold(
      (l) => null,
      (r) => {
        r.listen((data) {
          selectChat.value.messages.add(data);
          selectChat.refresh();
          rowDown();
        })
      },
    );
  }
// --------------------------

  void onSelect(int index) {
    selectChat.value = listChatMessage[index];
    // selectChat.value.messages;
    openTab();
    rowDown();
  }

  bool isUserTalk(int index) {
    return selectChat.value.messages[index].codFrom == login.value;
  }

  void rowDown() {
    Timer(
        Duration(milliseconds: 200),
        () => listViewConMessages.value.position.animateTo(
              listViewConMessages.value.position.maxScrollExtent,
              duration: Duration(seconds: 1),
              curve: Curves.easeOutSine,
            ));
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
