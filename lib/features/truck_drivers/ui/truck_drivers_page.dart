import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/truck_drivers/domain/enum/delivery_status_enum.dart';
import 'package:t_truck_web/features/truck_drivers/ui/truck_drivers_controller.dart';

class TruckDriversPage extends GetWidget<TruckDriversController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        children: [
          const TitleComponent(
            title: 'Motoristas',
          ),
          BodyComponent(
            child: Obx(
              () => TableComponent(
                header: const [
                  'Cod.',
                  'Motorista',
                  'Entregas',
                  'Status',
                  '',
                ],
                data: controller.list
                    .map((e) => [
                          Text(
                            e.cod,
                            style: StylesTypography.h16Bold,
                          ),
                          Text(
                            e.truckDriver,
                            style: StylesTypography.h16Bold,
                          ),
                          TableCellComponent(
                            value: e.quantityDelivers,
                            color: StylesColors.graySoft,
                            width: 80,
                          ),
                          TableCellComponent(
                            value: e.deliveryStatus.desc,
                            color: e.deliveryStatus.color,
                            typeCellComponent: TypeCellComponent.outline,
                          ),
                          Text(
                            'Enviar',
                            style: StylesTypography.h16,
                          ),
                        ])
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
