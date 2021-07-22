import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/map_component.dart';

class ExpandedMapComponent extends StatefulWidget {
  final void Function()? onTap;

  const ExpandedMapComponent({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  _ExpandedMapComponentState createState() => _ExpandedMapComponentState();
}

class _ExpandedMapComponentState extends State<ExpandedMapComponent> {
  LocationMapEntity lastPostion = Get.arguments as LocationMapEntity;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'mapa-tag',
      child: MapComponent(
        onPositionChanged: (position) => lastPostion = position,
        initialPosition: Get.arguments as LocationMapEntity,
        onTap: () =>
            Get.offNamedUntil('/home', (route) => true, arguments: lastPostion),
      ),
    );
  }
}
