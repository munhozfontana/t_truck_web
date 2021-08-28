import 'package:flutter/cupertino.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

class ChatPerson {
  int id;
  Widget avatar;
  String name;
  String codPerson;
  List<ChatMessage> messages;

  ChatPerson({
    required this.id,
    required this.avatar,
    required this.name,
    required this.codPerson,
    required this.messages,
  });

  ChatPerson copyWith({
    int? id,
    Widget? avatar,
    String? name,
    String? codPerson,
    List<ChatMessage>? messages,
  }) {
    return ChatPerson(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      codPerson: codPerson ?? this.codPerson,
      messages: messages ?? this.messages,
    );
  }
}
