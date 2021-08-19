import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';

abstract class IListMessageCase {
  Future<Either<Failure, List<MessageEntity>>> call(Params params);
}
