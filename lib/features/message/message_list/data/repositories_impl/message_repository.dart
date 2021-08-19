import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/message/message_list/data/external/protocols/i_message_external.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/repositories/i_message_repository.dart';

class MessageRepository implements IMessageRepository {
  final IMessageExternal iMessageExternal;

  MessageRepository({
    required this.iMessageExternal,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> get() async {
    try {
      return Right(await iMessageExternal.get());
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
