import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity_enum.dart';

class MessageEntity {
  final int cod;
  final String subject;
  final MessageEntityEnum status;

  MessageEntity({
    required this.cod,
    this.subject = 'Sem informação',
    this.status = MessageEntityEnum.none,
  });
}
