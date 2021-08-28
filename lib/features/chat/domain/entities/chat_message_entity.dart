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

  String toJson() => base64Encode(utf8.encode(json.encode(toMap())));

  factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(
      json.decode(utf8.decode(base64Decode(source))) as Map<String, dynamic>);

  ChatMessage copyWith({
    DateTime? createAt,
    int? codSender,
    String? content,
  }) {
    return ChatMessage(
      createAt: createAt ?? this.createAt,
      codSender: codSender ?? this.codSender,
      content: content ?? this.content,
    );
  }
}
