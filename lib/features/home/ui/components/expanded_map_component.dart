import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/map_component.dart';

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
        onTap: () => Get.offNamedUntil(
          (Get.arguments as LocationMapEntity).pathBack,
          (route) => true,
          arguments: lastPostion,
        ),
      ),
    );
  }
}
