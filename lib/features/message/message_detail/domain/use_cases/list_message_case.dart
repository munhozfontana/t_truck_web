import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/message/message_detail/domain/entities/message_entity.dart';
import 'package:t_truck_web/features/message/message_detail/domain/repository/i_message_repository.dart';

import 'protocols/i_list_message_case.dart';

class ListMessageCase implements IListMessageCase {
  IMessageRepository iMessageRepository;

  ListMessageCase({
    required this.iMessageRepository,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> call(Params param) {
    return iMessageRepository.getById(param.id!);
  }
}
