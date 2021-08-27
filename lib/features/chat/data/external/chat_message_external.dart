import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

import 'protocols/i_chat_message_external.dart';

class ChatMessageExternal implements IChatMessageExternal {
  final socket = io('http://127.0.0.1:3001', <String, dynamic>{
    'transports': ['websocket'],
  });

  StreamController<ChatMessage> streamData = StreamController.broadcast();

  @override
  void sendMessage(ChatMessage chatMessage) {
    try {
      socket.io.options['extraHeaders'] = {
        'Content-Type': 'application/json; charset=utf-8'
      };
      socket.emit('message', chatMessage.toJson());
    } catch (e) {
      throw ApiException(error: 'Serviço indiponível');
    }
  }

  @override
  Stream<ChatMessage> onReceiveMessage() {
    try {
      socket.on(
        'message',
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
