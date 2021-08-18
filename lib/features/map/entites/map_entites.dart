import 'dart:convert';

import 'package:flutter/material.dart';

class LocationMapEntity {
  double latitude;
  double longitude;
  String pathBack;

  LocationMapEntity({
    required this.latitude,
    required this.longitude,
    this.pathBack = '/',
  });

  LocationMapEntity copyWith({
    double? latitude,
    double? longitude,
    String? pathBack,
  }) {
    return LocationMapEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      pathBack: pathBack ?? this.pathBack,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'pathBack': pathBack,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'LocationMapEntity(latitude: $latitude, longitude: $longitude, pathBack: $pathBack)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationMapEntity &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.pathBack == pathBack;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ pathBack.hashCode;
}

class MarkerMapEntity {
  LocationMapEntity locationMapEntity;
  String name;
  Widget child;
  MarkerMapEntity({
    required this.locationMapEntity,
    required this.name,
    required this.child,
  });
}
