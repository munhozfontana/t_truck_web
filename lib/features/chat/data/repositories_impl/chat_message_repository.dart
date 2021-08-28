import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/chat/data/external/protocols/i_chat_message_external.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_message_entity.dart';

import '../../domain/repositories/i_chat_message_repository.dart';

class ChatMessageRepository implements IChatMessageRepository {
  final IChatMessageExternal iChatMessageExternal;

  ChatMessageRepository({
    required this.iChatMessageExternal,
  });

  @override
  Either<Failure, void> sendMessage(ChatMessage chatMessage) {
    try {
      return Right(iChatMessageExternal.sendMessage(chatMessage));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }

  @override
  Either<Failure, Stream<ChatMessage>> onReceiveMessage(String idUser) {
    try {
      return Right(iChatMessageExternal.onReceiveMessage(idUser));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
