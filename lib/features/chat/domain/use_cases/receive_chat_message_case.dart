import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';
import 'package:t_truck_web/features/chat/domain/repositories/i_chat_message_repository.dart';

import 'protocols/i_receive_chat_message_case.dart';

class ReceiveChatMessageCase implements IReceiveChatMessageCase {
  IChatMessageRepository iChatMessageRepository;

  ReceiveChatMessageCase({
    required this.iChatMessageRepository,
  });

  @override
  Either<Failure, Stream<ChatMessage>> call(Params params) {
    return iChatMessageRepository.onReceiveMessage();
  }
}
