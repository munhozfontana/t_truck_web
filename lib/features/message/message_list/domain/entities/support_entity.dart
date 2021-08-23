import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity_enum.dart';

class SupportEntity {
  final int cod;
  final String subject;
  final SupportEntityEnum status;
  final DateTime openAt;
  final List<MessageEntity> messageEntity;

  SupportEntity({
    required this.cod,
    this.subject = 'Sem informação',
    this.status = SupportEntityEnum.none,
    required this.openAt,
    required this.messageEntity,
  });
}
