import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required int id,
    required String nameFrom,
    required String nameTo,
    required String content,
    required DateTime sendAt,
  }) : super(
          id: id,
          nameFrom: nameFrom,
          nameTo: nameTo,
          content: content,
          sendAt: sendAt,
        );

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      nameFrom: map['nameFrom'] as String,
      nameTo: map['nameTo'] as String,
      content: map['content'] as String,
      sendAt: DateTime.fromMillisecondsSinceEpoch(map['sendAt'] as int),
    );
  }
}
