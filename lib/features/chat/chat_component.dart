import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/chat/chat_controller.dart';
import 'package:t_truck_web/features/chat/chat_talk_component.dart';
import 'package:t_truck_web/features/chat/chat_user_component.dart';

class ChatComponent extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
        width: 300,
        height: controller.maxHeight.value,
        alignment: controller.chat.value
            ? Alignment.bottomRight
            : const Alignment(0, 15),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ChatUserComponent(
              onSelect: controller.onSelect,
              onClose: () {
                controller.closeTab();
                controller.closeChat();
              },
              width: 300,
              height: controller.minHeight.value,
            ),
            const ChatTalkComponent()
          ],
        ),
      );
    });
  }
}
