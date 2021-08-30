import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

import 'protocols/i_chat_message_external.dart';

class ChatMessageExternal implements IChatMessageExternal {
  final socket = io('chat:3001', <String, dynamic>{
    'transports': ['websocket'],
  });

  StreamController<ChatMessage> streamData = StreamController.broadcast();

  @override
  void sendMessage(ChatMessage chatMessage) {
    try {
      socket.emit('message', chatMessage.toJson());
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }

  @override
  Stream<ChatMessage> onReceiveMessage(String idUser) {
    try {
      socket.on(
        'message-$idUser',
        (data) => {
          streamData.add(
            ChatMessage.fromJson(data as String),
          )
        },
      );
      return streamData.stream;
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }
}
