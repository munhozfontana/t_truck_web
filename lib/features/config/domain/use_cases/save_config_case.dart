import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/config/domain/repositories/i_config_repository.dart';

import 'protocols/i_save_config_case.dart';

class SaveConfigCase implements ISaveConfigCase {
  IConfigRepository iConfigRepository;

  SaveConfigCase({
    required this.iConfigRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) {
    return iConfigRepository.save(params.configEntity!);
  }
}
