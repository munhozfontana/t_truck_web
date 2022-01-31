import 'package:dartz/dartz.dart';
import 'package:t_truck_web/core/error/failures.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/models/products_model.dart';

abstract class IDetailDevolutionCase {
  Future<Either<Failure, List<ProductsModel>>> call(Params param);
}
