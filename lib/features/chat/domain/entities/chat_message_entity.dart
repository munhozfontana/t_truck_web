import 'dart:convert';

class ChatMessage {
  final DateTime createAt;
  final int codTo;
  final int codFrom;
  final String content;

  ChatMessage({
    required this.content,
    required this.codTo,
    required this.createAt,
    required this.codFrom,
  });

  Map<String, dynamic> toMap() {
    return {
      'codTo': codTo,
      'content': content,
      'codFrom': codFrom,
      'createAt': createAt.millisecondsSinceEpoch,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      codTo: map['codTo'] as int,
      codFrom: map['codFrom'] as int,
      content: map['content'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
    );
  }

  String toJson() => base64Encode(utf8.encode(json.encode(toMap())));

  factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(
      json.decode(utf8.decode(base64Decode(source))) as Map<String, dynamic>);
}
