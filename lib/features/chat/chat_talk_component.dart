import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/chat/chat_controller.dart';

class ChatTalkComponent extends GetWidget<ChatController> {
  const ChatTalkComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
        width: 300,
        height: controller.visibleChatTalkComponent.value
            ? controller.maxHeight.value * 1.2
            : 0,
        padding: controller.edgeInsets,
        decoration: controller.boxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header(),
            const Divider(),
            listMessages(),
            const SizedBox(height: 8),
            sendMessage()
          ],
        ),
      );
    });
  }

  ConstrainedBox sendMessage() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 90),
      child: TextField(
        textInputAction: TextInputAction.go,
        controller: controller.textSendMessage,
        maxLines: null,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: controller.onSendMessage,
            icon: Icon(Icons.send),
          ),
          hintText: 'Digitar mensagem',
        ),
      ),
    );
  }

  Expanded listMessages() {
    return Expanded(
      child: ListView.separated(
          controller: controller.listViewConMessages.value,
          itemBuilder: (context, index) => Row(
                textDirection: controller.isUserTalk(index)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: controller.isUserTalk(index)
                            ? StylesColors.grayWhite.withOpacity(.1)
                            : StylesColors.gray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        controller.selectChat.value.messages[index].content,
                        style: StylesTypography.h14.copyWith(
                            color: controller.isUserTalk(index)
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 24,
              ),
          itemCount: controller.selectChat.value.messages.length),
    );
  }

  Row header() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: StylesColors.grayWhite.withOpacity(.3),
                width: 2,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: StylesColors.grayWhitePlus,
                child: controller.selectChat.value.avatar,
              ),
              title: Text(controller.selectChat.value.title),
              subtitle: Text(controller.selectChat.value.subtitle),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: controller.closeTab,
            child: const Icon(Icons.arrow_back),
          ),
        )
      ],
    );
  }
}
