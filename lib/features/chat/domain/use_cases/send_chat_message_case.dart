import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/chat/domain/repositories/i_chat_message_repository.dart';

import 'protocols/i_send_chat_message_case.dart';

class SendChatMessageCase implements ISendChatMessageCase {
  IChatMessageRepository iChatMessageRepository;

  SendChatMessageCase({
    required this.iChatMessageRepository,
  });

  @override
  Either<Failure, void> call(Params params) {
    return iChatMessageRepository.sendMessage(params.chatMessageEntity!);
  }
}
