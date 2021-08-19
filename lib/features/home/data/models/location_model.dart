import 'dart:convert';

import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';
import 'package:t_truck_web/features/home/domain/entities/truck_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required int codMot,
    required num latitude,
    required num longitude,
  }) : super(
            latitude: latitude,
            longitudade: longitude,
            truck: TruckEntity(cod: codMot));

  Map<String, dynamic> toMap() {
    return {
      'LATITUDE': latitude,
      'LONGITUDADE': longitudade,
      'CODMOT': truck.cod,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: num.tryParse(map['LATITUDE'] as String) ?? 0,
      longitude: num.tryParse(map['LONGITUDE'] as String) ?? 0,
      codMot: map['CODMOT'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
