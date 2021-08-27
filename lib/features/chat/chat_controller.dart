import 'dart:async';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/utils/string_utils.dart';
import 'package:t_truck_web/features/chat/models/chat_message.dart';
import 'package:t_truck_web/features/chat/models/chat_person.dart';

class ChatController extends GetxController {
  final socket = IO.io('http://127.0.0.1:3001', <String, dynamic>{
    'transports': ['websocket'],
  });

  // Variables
  RxList<ChatPerson> listChatMessage = <ChatPerson>[].obs;
  Rx<ScrollController> listViewConMessages = ScrollController().obs;

  RxBool visibleChatTalkComponent = false.obs;
  RxBool chat = false.obs;

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
    socket.onConnect((_) {
      print('connect');
    });

    onReceiveMessage();

    // socket.on('event', (data) => print(data));
    // socket.onDisconnect((_) => print('disconnect'));
    // socket.on('fromServer', (_) => print(_));

    listChatMessage.value = List.generate(
        20,
        (index) => ChatPerson(
              avatar: Text(
                StringUtils.fisrtAndLastLatter(
                  Faker().person.name(),
                ),
              ),
              id: index,
              title: Faker().person.firstName(),
              subtitle: Faker().internet.ipv4Address(),
              messages: [],
            ));
  }

// --------------------------
  void onSendMessage() async {
    socket.emit(
        'message',
        ChatMessage(
                content: textSendMessage.text,
                codSender: int.parse(await Get.find<ILoggedUser>().login))
            .toJson());
  }

  void onReceiveMessage() {
    socket.on('message', (data) {
      selectChat.value.messages.add(ChatMessage.fromJson(data as String));
      selectChat.refresh();
      Timer(Duration(milliseconds: 100), rowDown);
    });
  }
// --------------------------

  void onSelect(int index) {
    selectChat.value = listChatMessage[index];
    selectChat.value.messages.addAll(List.generate(
        9,
        (index) => ChatMessage(
            content: Faker().lorem.sentence(),
            codSender: Random().nextInt(2) == 1 ? 355911 : 355912)));
    openTab();

    Timer(Duration(milliseconds: 200), () {
      rowDown();
    });
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
