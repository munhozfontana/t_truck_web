import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
  }) {
    return LocationMapEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
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

class MapComponent extends StatefulWidget {
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
  _MapComponentState createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  var _ignore = true;
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 100),
        () => {
              super.setState(() {
                _ignore = false;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return IgnorePointer(
          ignoring: _ignore,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FlutterMap(
                  options: MapOptions(
                    allowPanning: true,
                    onPositionChanged: (a, b) {
                      if (b && widget.onPositionChanged != null) {
                        widget.onPositionChanged!(LocationMapEntity(
                            latitude: a.center!.latitude,
                            longitude: a.center!.longitude));
                      }
                    },
                    center: LatLng(
                      widget.initialPosition.latitude,
                      widget.initialPosition.longitude,
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
                  onTap: widget.onTap,
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
          ),
        );
      },
    );
  }
}
