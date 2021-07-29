import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/truck_drivers/ui/truck_drivers_controller.dart';

class TruckDriversPage extends GetWidget<TruckDriversController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Center(
        child: Text(
          'Truck',
          style: StylesTypography.h48,
        ),
      ),
    );
  }
}
