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
  Rx<ScrollController> listViewConMessages = ScrollController().obs;
  RxList<ChatPerson> listChatMessage = <ChatPerson>[].obs;
  RxBool visibleChatTalkComponent = false.obs;
  RxBool chat = false.obs;
  RxBool anyNotification = false.obs;
  RxInt login = 0.obs;
  RxString loginMaybeEmpty = ''.obs;

  ChatController({
    required this.iSendChatMessageCase,
    required this.iReceiveChatMessageCase,
    required this.iListChatPeopleCase,
    required this.iLoggedUser,
  });

  TextEditingController textSendMessage = TextEditingController();

  Rx<ChatPerson> selectChat = ChatPerson(
    notifications: 0,
    id: 0,
    avatar: Text(""),
    name: "",
    codPerson: "",
    messages: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }

  Future<void> getInitialData() async {
    loginMaybeEmpty.value = await iLoggedUser.login;
    onReceiveMessage();
    if (loginMaybeEmpty.isNotEmpty) {
      login.value = int.parse(loginMaybeEmpty.value);
      (await iListChatPeopleCase(Params(idUser: loginMaybeEmpty.value))).fold(
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
    final chatMessage = ChatMessage(
      content: textSendMessage.text,
      codFrom: login.value,
      codTo: int.parse(selectChat.value.codPerson),
      createAt: DateTime.now(),
    );

    listChatMessage.value = listChatMessage.map((e) {
      if (e.codPerson == chatMessage.codTo.toString()) {
        e.messages.add(chatMessage);
      }
      return e;
    }).toList();

    listChatMessage.refresh();
    selectChat.refresh();
    update();
    rowDown();

    iSendChatMessageCase(
      Params(
        chatMessageEntity: chatMessage,
      ),
    );

    textSendMessage.clear();
  }

  void onReceiveMessage() {
    iReceiveChatMessageCase(Params(idUser: loginMaybeEmpty.value)).fold(
      (l) => null,
      (r) => {
        r.listen((data) {
          listChatMessage.value = listChatMessage.map((e) {
            if (e.codPerson == data.codFrom.toString()) {
              e.messages.add(data);
              if (selectChat.value.codPerson != data.codFrom.toString()) {
                e.notifications = e.notifications + 1;
              }
            }
            return e;
          }).toList();
          listChatMessage.refresh();
          update();
          selectChat.refresh();
          if (listChatMessage
              .where((item) => item.notifications > 0)
              .isNotEmpty) {
            anyNotification.value = true;
          } else {
            anyNotification.value = false;
          }
          rowDown();
        })
      },
    );
  }

// --------------------------

  void onSelect(int index) {
    listChatMessage[index] = listChatMessage[index].copyWith(notifications: 0);
    selectChat.value = listChatMessage[index];
    listChatMessage.refresh();
    update();
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
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutSine,
            ));
  }

  void closeTab() {
    visibleChatTalkComponent.value = false;
    selectChat = ChatPerson(
      notifications: 0,
      id: 0,
      avatar: Text(""),
      name: "",
      codPerson: "",
      messages: [],
    ).obs;
  }

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
