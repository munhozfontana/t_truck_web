import 'package:t_truck_web/features/devolution/devolution_list/data/models/devolution_model.dart';

abstract class IDevolutionExternal {
  Future<List<DevolutionModel>> get();
}
