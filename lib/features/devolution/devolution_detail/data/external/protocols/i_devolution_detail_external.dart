import 'package:t_truck_web/features/devolution/devolution_detail/data/models/products_model.dart';

abstract class IDevolutionDetailExternal {
  Future<List<ProductsModel>> getById(int cod);
}
