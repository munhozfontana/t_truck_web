import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_card_component.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_progress_status_enum.dart';

import './devolution_list_controller.dart';

class DevolutionListPage extends GetView<DevolutionListController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        children: [
          Visibility(
            visible: Responsive.isNotMobile(context),
            child: const TitleComponent(
              title: 'Devoluções',
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

  Widget tableCard() {
    return TableCardComponent(
      onTap: (index) => controller.toDetailPage(
        controller.list.elementAt(index),
      ),
      listTableCardItem: controller.list
          .map(
            (element) => TableCardItem(
              iconTrailing: const Icon(Icons.arrow_right),
              title: element.client,
              leading:
                  (element.devolutionProgressStatus as DevolutionProgressStatus)
                      .icon,
              tooltip:
                  (element.devolutionProgressStatus as DevolutionProgressStatus)
                      .desc,
            ),
          )
          .toList(),
    );
  }

  TableComponent table() {
    return TableComponent(
      header: const [
        'Cod Motorista',
        'Nº da Nota Fiscal',
        'Cod Cli',
        'Cliente',
        'Status',
        '',
      ],
      space: const [
        1,
        1,
        1,
        4,
        1,
        1,
      ],
      data: controller.list
          .map((e) => [
                Text(
                  e.codMot.toString(),
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.cod.toString(),
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.codClie,
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.client,
                  style: StylesTypography.h16Bold,
                ),
                TableCellComponent(
                  value:
                      (e.devolutionProgressStatus as DevolutionProgressStatus)
                          .desc,
                  color:
                      (e.devolutionProgressStatus as DevolutionProgressStatus)
                          .color,
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
}
