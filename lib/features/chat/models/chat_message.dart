import 'dart:convert';

class ChatMessage {
  DateTime createAt = DateTime.now();
  final int codSender;
  final String content;

  ChatMessage({
    required this.content,
    required this.codSender,
  });

  Map<String, dynamic> toMap() {
    return {
      'codSender': codSender,
      'content': content,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      codSender: map['codSender'] as int,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}
