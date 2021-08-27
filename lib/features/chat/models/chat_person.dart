import 'package:flutter/cupertino.dart';
import 'package:t_truck_web/features/chat/models/chat_message.dart';

class ChatPerson {
  int id;
  Widget avatar;
  String title;
  String subtitle;
  List<ChatMessage> messages;

  ChatPerson({
    required this.id,
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.messages,
  });
}
