import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity_enum.dart';

class SupportEntity {
  final int cod;
  final String subject;
  final MessageEntityEnum status;
  final DateTime openAt;
  final List<MessageEntity> messageEntity;

  SupportEntity({
    required this.cod,
    this.subject = 'Sem informação',
    this.status = MessageEntityEnum.none,
    required this.openAt,
    required this.messageEntity,
  });
}
