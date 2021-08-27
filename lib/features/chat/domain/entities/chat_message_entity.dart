import 'dart:convert';

class ChatMessage {
  final DateTime createAt;
  final int codSender;
  final String content;

  ChatMessage({
    required this.content,
    required this.codSender,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'codSender': codSender,
      'content': content,
      'createAt': createAt.millisecondsSinceEpoch,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      codSender: map['codSender'] as int,
      content: map['content'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}
