import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity.dart';

abstract class IMessageRepository {
  Future<Either<Failure, List<SupportEntity>>> get();
}
