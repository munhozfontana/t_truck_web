import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

abstract class IChatMessageExternal {
  void sendMessage(ChatMessage chatMessage);
  Stream<ChatMessage> onReceiveMessage();
}
