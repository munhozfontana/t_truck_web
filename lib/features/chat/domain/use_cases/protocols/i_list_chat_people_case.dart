import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/chat/domain/entities/chat_person_entity.dart';

abstract class IListChatPeopleCase {
  Future<Either<Failure, List<ChatPerson>>> call(Params params);
}
