import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/repositories/i_devolution_detail_repository.dart';

import 'protocols/i_devolution_detail_case.dart';

class DevolutionDetailCase implements IDetailDevolutionCase {
  IDevolutionDetailRepository iDevolutionDetailRepository;

  DevolutionDetailCase({
    required this.iDevolutionDetailRepository,
  });

  @override
  Future<Either<Failure, List<ProductsEntity>>> call(Params param) {
    return iDevolutionDetailRepository.getById(param.id!);
  }
}
