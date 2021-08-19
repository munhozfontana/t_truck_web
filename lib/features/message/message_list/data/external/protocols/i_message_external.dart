import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';

abstract class IMessageExternal {
  Future<List<MessageEntity>> get();
}
