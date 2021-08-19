import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

abstract class ITruckDriversExternal {
  Future<List<TruckDriversEntity>> get();
}
