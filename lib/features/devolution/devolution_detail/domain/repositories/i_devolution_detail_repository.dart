import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';

abstract class IDevolutionDetailRepository {
  Future<Either<Failure, List<ProductsEntity>>> getById(int cod);
}
