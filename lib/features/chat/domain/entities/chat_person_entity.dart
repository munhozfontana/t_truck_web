import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t_truck_web/core/utils/string_utils.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

class ChatPerson {
  final int id;
  final Widget avatar;
  final String name;
  final String codPerson;
  final List<ChatMessage> messages;
  int notifications;

  ChatPerson({
    required this.id,
    required this.avatar,
    required this.name,
    required this.codPerson,
    required this.messages,
    this.notifications = 0,
  });

  factory ChatPerson.fromMap(Map<String, dynamic> map) {
    return ChatPerson(
      id: 0,
      avatar: Text(
        StringUtils.fisrtAndLastLatter(
          map['NOME'] as String,
        ),
      ),
      name: map['NOME'] as String,
      codPerson: (map['MATRICULA'] as int).toString(),
      messages: [],
    );
  }

  factory ChatPerson.fromJson(String source) =>
      ChatPerson.fromMap(json.decode(source) as Map<String, dynamic>);

  ChatPerson copyWith({
    int? id,
    Widget? avatar,
    String? name,
    String? codPerson,
    List<ChatMessage>? messages,
    int? notifications,
  }) {
    return ChatPerson(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      codPerson: codPerson ?? this.codPerson,
      messages: messages ?? this.messages,
      notifications: notifications ?? this.notifications,
    );
  }
}
