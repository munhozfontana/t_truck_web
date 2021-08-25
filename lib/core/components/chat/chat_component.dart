import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/chat/chat_list_component.dart';
import 'package:t_truck_web/core/components/chat/chat_talk_component.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  _ChatComponentState createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
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
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ChatListComponent(
          onTap: (index) => print('aaa'),
          padding: edgeInsets,
          decoration: boxDecoration,
          width: 300,
          height: 330 * 1.2,
        ),
        ChatTalkComponent(
          padding: edgeInsets,
          decoration: boxDecoration,
          width: 300,
          height: 330 * 1.4,
        )
      ],
    );
  }
}
