import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/models/products_model.dart';

abstract class IDevolutionDetailRepository {
  Future<Either<Failure, List<ProductsModel>>> getById(int cod);
}
