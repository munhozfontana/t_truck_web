import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_card_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';

import '../../../../core/components/body_component.dart';
import '../../../../core/components/table/table_cell_component.dart';
import '../../../../core/components/table/table_component.dart';
import '../../../../core/styles/style_colors.dart';
import '../../../../core/styles/styles_fonts.dart';
import '../domain/entities/delivery_status_enum.dart';
import 'truck_drivers_list_controller.dart';

class TruckDriversListPage extends GetWidget<TruckDriversListController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              children: [
                Visibility(
                  visible: Responsive.isNotMobile(context),
                  child: const TitleComponent(
                    title: 'Motoristas',
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.fieldController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Digite o código(Cod) ou o nome do Motorista ',
                    hintStyle: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
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

  Widget table() {
    return TableComponent(
      header: const [
        'Cod.',
        'Motorista',
        'Entregas',
        'Status',
        '',
      ],
      space: const [
        1,
        4,
        1,
        1,
        1,
      ],
      data: controller.listFiltred
          .map(
            (e) => [
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
            ],
          )
          .toList(),
    );
  }

  Widget tableCard() {
    return TableCardComponent(
      onTap: (index) => controller.toDetailPage(
        controller.listFiltred.elementAt(index),
      ),
      listTableCardItem: controller.listFiltred
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
