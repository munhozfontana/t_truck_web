import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

abstract class IReceiveChatMessageCase {
  Either<Failure, Stream<ChatMessage>> call(Params params);
}
