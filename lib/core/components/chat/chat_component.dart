import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/chat/chat_list_component.dart';
import 'package:t_truck_web/core/components/chat/chat_talk_component.dart';
import 'package:t_truck_web/core/store_controller.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  _ChatComponentState createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  bool visibleChatTalkComponent = false;

  var maxHeightAnimated = 330 * 1.4;
  final maxHeight = 330 * 1.4;
  final minHeight = 330 * 1.2;
  final storeController = Get.find<StoreController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(
      top: 14,
      left: 16,
      right: 16,
    );
    const boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(22),
        topRight: Radius.circular(22),
      ),
    );

    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.decelerate,
        width: 300,
        height: storeController.chat.value ? maxHeightAnimated : 0,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ChatListComponent(
              onSelect: (index) {
                setState(() {
                  visibleChatTalkComponent = true;
                });
              },
              onClose: () {
                storeController.closeChat();
              },
              padding: edgeInsets,
              decoration: boxDecoration,
              width: 300,
              height: minHeight,
            ),
            ChatTalkComponent(
              visible: visibleChatTalkComponent,
              padding: edgeInsets,
              decoration: boxDecoration,
              width: 300,
              height: maxHeight,
            )
          ],
        ),
      );
    });
  }
}
