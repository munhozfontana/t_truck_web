import 'package:t_truck_web/features/home/domain/entities/truck_entity.dart';

class LocationEntity {
  final num latitude;
  final num longitudade;
  final TruckEntity truck;

  LocationEntity({
    required this.latitude,
    required this.longitudade,
    required this.truck,
  });
}
