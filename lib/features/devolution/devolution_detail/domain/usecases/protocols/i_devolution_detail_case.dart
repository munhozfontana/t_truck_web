import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';

abstract class IDetailDevolutionCase {
  Future<Either<Failure, List<ProductsEntity>>> call(Params param);
}
