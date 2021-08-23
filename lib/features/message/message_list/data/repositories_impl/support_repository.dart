import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:t_truck_web/core/error/api_exception.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/message/message_list/data/external/protocols/i_support_external.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/support_entity.dart';
import 'package:t_truck_web/features/message/message_list/domain/repositories/i_support_repository.dart';

class SupportRepository implements ISupportRepository {
  final ISupportExternal iSupportExternal;

  SupportRepository({
    required this.iSupportExternal,
  });

  @override
  Future<Either<Failure, List<SupportEntity>>> get() async {
    try {
      return Right(await iSupportExternal.get());
    } on ApiException catch (e) {
      Logger().w(e);
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      Logger().w(e);
      return const Left(AppFailure(detail: 'Erro ao receber informações'));
    }
  }
}
