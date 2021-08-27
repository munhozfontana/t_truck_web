import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/chat/data/external/protocols/i_chat_people_external.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_person_entity.dart';

import '../../domain/repositories/i_chat_people_repository.dart';

class ChatPeopleRepository implements IChatPeopleRepository {
  final IChatPeopleExternal iChatPeopleExternal;

  ChatPeopleRepository({
    required this.iChatPeopleExternal,
  });

  @override
  Future<Either<Failure, List<ChatPerson>>> listByToken(int perfil) async {
    try {
      return Right(await iChatPeopleExternal.listByToken(perfil));
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
