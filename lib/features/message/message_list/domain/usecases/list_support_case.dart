import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/repositories/i_support_repository.dart';

import 'protocols/i_list_support_case.dart';

class ListSupportCase implements IListSupportCase {
  ISupportRepository iSupportRepository;

  ListSupportCase({
    required this.iSupportRepository,
  });

  @override
  Future<Either<Failure, List<SupportEntity>>> call(Params params) {
    return iSupportRepository.get();
  }
}
