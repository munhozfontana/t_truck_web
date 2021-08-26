import 'package:flutter/cupertino.dart';

class ChatMessage {
  int id;
  Widget avatar;
  String title;
  String subtitle;

  ChatMessage({
    required this.id,
    required this.avatar,
    required this.title,
    required this.subtitle,
  });
}
