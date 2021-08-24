import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/message/message_detail/data/external/i_message_external/i_message_external.dart';
import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';

import '../../domain/repository/i_message_repository.dart';

class MessageRepository implements IMessageRepository {
  final IMessageExternal iMessageExternal;

  MessageRepository({
    required this.iMessageExternal,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> getById(int cod) async {
    try {
      return Right(await iMessageExternal.getById(cod));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
