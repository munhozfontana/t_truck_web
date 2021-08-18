import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'map_controller.dart';

class MapPage extends GetView<MapPageController> {
  final void Function()? onTap;

  const MapPage({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: controller.onPointerSignal,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Obx(() {
                  return FluterMapAdapter(
                    markers: controller.markers
                        .map((e) => Marker(
                              point: LatLng(
                                e.locationMapEntity.latitude,
                                e.locationMapEntity.longitude,
                              ),
                              builder: (context) => e.child,
                            ))
                        .toList(),
                    fluterMapAdapterController:
                        controller.controlChildMap.value,
                  );
                }),
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
      ),
    );
  }
}

class FluterMapAdapterController {
  late bool Function(LatLng center, double zoom, {String? id}) move;
  late bool Function(double degree, {String? id}) rotate;
  late LatLng Function() center;
  late double Function() zoom;
}

class FluterMapAdapter extends StatefulWidget {
  final List<Marker> markers;
  final FluterMapAdapterController fluterMapAdapterController;

  const FluterMapAdapter(
      {Key? key,
      this.markers = const [],
      required this.fluterMapAdapterController})
      : super(key: key);

  @override
  _FluterMapAdapterState createState() =>
      _FluterMapAdapterState(fluterMapAdapterController);
}

class _FluterMapAdapterState extends State<FluterMapAdapter> {
  _FluterMapAdapterState(
      FluterMapAdapterController fluterMapAdapterController) {
    fluterMapAdapterController.move = mapController.move;
    fluterMapAdapterController.rotate = mapController.rotate;
    fluterMapAdapterController.center = center;
    fluterMapAdapterController.zoom = zoom;
  }

  final MapController mapController = MapController();

  LatLng center() {
    return mapController.center;
  }

  double zoom() {
    return mapController.zoom;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        // onPositionChanged: (a, b) {
        //   if (b && widget.onPositionChanged != null) {
        //     widget.onPositionChanged!(LocationMapEntity(
        //         latitude: a.center!.latitude,
        //         longitude: a.center!.longitude,
        //         pathBack: ''));
        //   }
        // },
        center: LatLng(
          -15,
          -48,
        ),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(markers: widget.markers),
      ],
    );
  }
}
