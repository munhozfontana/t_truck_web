import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';

abstract class ILocationExternal {
  Future<List<LocationEntity>> get();
}
