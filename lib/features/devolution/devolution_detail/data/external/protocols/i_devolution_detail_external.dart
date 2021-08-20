import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';

abstract class IDevolutionDetailExternal {
  Future<List<ProductsEntity>> getById(int cod);
}
