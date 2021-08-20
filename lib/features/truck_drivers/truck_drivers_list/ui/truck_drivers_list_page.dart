import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_card_component.dart';

import '../../../../core/components/body_component.dart';
import '../../../../core/components/table/table_cell_component.dart';
import '../../../../core/components/table/table_component.dart';
import '../../../../core/components/title_component.dart';
import '../../../../core/styles/style_colors.dart';
import '../../../../core/styles/styles_fonts.dart';
import '../domain/entities/delivery_status_enum.dart';
import 'truck_drivers_list_controller.dart';

class TruckDriversListPage extends GetWidget<TruckDriversListController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        children: [
          Visibility(
            visible: Responsive.isNotMobile(context),
            child: const TitleComponent(
              title: 'Motoristas',
            ),
          ),
          BodyComponent(
            child: Obx(
              () => Responsive.when(
                context,
                mobile: tableCard(),
                orOther: table(),
              ),
            ),
          )
        ],
      ),
    );
  }

  TableComponent table() {
    return TableComponent(
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
                  value: e.status.desc,
                  color: e.status.color,
                  typeCellComponent: TypeCellComponent.outline,
                  width: 180,
                ),
                SizedBox(
                  height: 30,
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => controller.toDetailPage(e),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Visualizar',
                            style: StylesTypography.h14w500.copyWith(
                              color: StylesColors.black.withOpacity(.4),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            size: 20,
                            color: StylesColors.black.withOpacity(
                              .4,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ])
          .toList(),
    );
  }

  Widget tableCard() {
    return TableCardComponent(
      onTap: (index) => controller.toDetailPage(
        controller.list.elementAt(index),
      ),
      listTableCardItem: controller.list
          .map(
            (element) => TableCardItem(
              iconTrailing: const Icon(Icons.arrow_right),
              title: element.truckDriver,
              leading: element.status.icon,
              tooltip: element.status.desc,
            ),
          )
          .toList(),
    );
  }
}