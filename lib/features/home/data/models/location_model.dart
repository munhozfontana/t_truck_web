import 'dart:convert';

import 'package:t_truck_web/features/home/domain/entities/location_entity.dart';
import 'package:t_truck_web/features/home/domain/entities/truck_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required num latitude,
    required num longitude,
    // required int codMot,
    // required DateTime createAt,
    required TruckEntity truckEntity,
  }) : super(
          latitude: latitude,
          longitudade: longitude,
          truck: truckEntity,
        );

  Map<String, dynamic> toMap() {
    return {
      'LATITUDE': latitude,
      'LONGITUDADE': longitudade,
      'CODMOT': truck.cod,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      truckEntity: TruckEntity(
        createAt: DateTime.parse(map['DATA'] as String),
        cod: map['CODMOT'] as int,
      ),
      latitude: num.tryParse(map['LATITUDE'] as String) ?? 0,
      longitude: num.tryParse(map['LONGITUDE'] as String) ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
