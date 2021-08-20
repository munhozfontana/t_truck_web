import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';

abstract class ITruckDriversDetailsExternal {
  Future<List<OrderEntity>> getById(int codMot);
}
