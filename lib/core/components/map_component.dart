import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
  Icon icon;
  MarkerMapEntity({
    required this.locationMapEntity,
    required this.name,
    required this.icon,
  });
}

class MapComponent extends StatelessWidget {
  final void Function()? onTap;
  final void Function(LocationMapEntity)? onPositionChanged;
  final LocationMapEntity initialPosition;
  final List<MarkerMapEntity>? markers;

  const MapComponent({
    Key? key,
    this.onTap,
    this.onPositionChanged,
    this.markers,
    required this.initialPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                options: MapOptions(
                  onPositionChanged: (a, b) {
                    if (b && onPositionChanged != null) {
                      onPositionChanged!(LocationMapEntity(
                          latitude: a.center!.latitude,
                          longitude: a.center!.longitude,
                          pathBack: ''));
                    }
                  },
                  center: LatLng(
                    initialPosition.latitude,
                    initialPosition.longitude,
                  ),
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsets.all(constraints.maxHeight / 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 50,
                  child: const Icon(
                    Icons.zoom_out_map_rounded,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
