import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_entity.dart';

abstract class IDevolutionExternal {
  Future<List<DevolutionEntity>> get();
  Future<List<ProductsEntity>> getById(int cod);
}
