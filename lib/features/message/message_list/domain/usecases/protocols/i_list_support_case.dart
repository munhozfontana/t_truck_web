import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity.dart';

abstract class IListSupportCase {
  Future<Either<Failure, List<SupportEntity>>> call(Params params);
}
