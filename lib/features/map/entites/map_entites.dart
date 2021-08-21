import 'dart:convert';

import 'package:flutter/material.dart';

class LocationMapEntity {
  double latitude;
  double longitude;

  LocationMapEntity({
    required this.latitude,
    required this.longitude,
  });

  LocationMapEntity copyWith({
    double? latitude,
    double? longitude,
    String? pathBack,
  }) {
    return LocationMapEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'LocationMapEntity(latitude: $latitude, longitude: $longitude)';
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

  @override
  String toString() =>
      'MarkerMapEntity(locationMapEntity: $locationMapEntity, name: $name, child: $child)';
}
