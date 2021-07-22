import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/adapters/map/i_map_adp.dart';
import '../../../../core/adapters/map/map_entity.dart';

class MapBox implements IMapAdp {
  final void Function() onTap;

  MapBox({required this.onTap});

  @override
  MapEntity init() {
    return MapEntity(
      map: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
            ],
          ),
        ),
      ),
    );
  }
}
