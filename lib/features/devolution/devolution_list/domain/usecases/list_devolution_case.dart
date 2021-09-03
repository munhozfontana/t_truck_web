import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/models/devolution_model.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/repositories/i_devolution_repository.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/usecases/protocols/i_list_devolution_case.dart';

class ListDevolutionCase implements IListDevolutionCase {
  IDevolutionRepository iDevolutionRepository;

  ListDevolutionCase({
    required this.iDevolutionRepository,
  });

  @override
  Future<Either<Failure, List<DevolutionModel>>> call(Params params) {
    return iDevolutionRepository.get();
  }
}
