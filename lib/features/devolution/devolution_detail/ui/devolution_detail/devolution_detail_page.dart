import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_card_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/devolution_status_enum.dart';

import './devolution_detail_controller.dart';

class DevolutionDetailPage extends GetView<DevolutionDetailController> {
  @override
  Widget build(BuildContext context) {
    final status =
        (controller.devolution.value.status as DevolutionStatus).desc;
    return LayoutComponent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Cliente: ${controller.devolution.value.client}',
                  textAlign: TextAlign.justify,
                  style: Responsive.when(context,
                      mobile: StylesTypography.h16,
                      orOther: StylesTypography.h18),
                ),
                Text(
                  'Motivo nº ${controller.devolution.value.cod}',
                  style: Responsive.when(context,
                      mobile: StylesTypography.h21,
                      orOther: StylesTypography.h24),
                ),
                Text(
                  status,
                  style: Responsive.when(context,
                      mobile: StylesTypography.h14w500,
                      orOther: StylesTypography.h16W400),
                ),
                Text(
                  'Data da devolução: ${DateFormat('yyyy-MM-dd').format(controller.devolution.value.data)}',
                  style: Responsive.when(context,
                      mobile: StylesTypography.h14w500,
                      orOther: StylesTypography.h16W400.copyWith(
                        color: StylesColors.black.withOpacity(.5),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Obx(() {
              return Responsive.when(
                context,
                mobile: tableCard(),
                orOther: table(),
              );
            }),
          )
        ],
      ),
    );
  }

  TableComponent table() {
    return TableComponent(
      space: const [
        1,
        4,
        1,
        1,
        1,
      ],
      data: [
        ...controller.list
            .map((item) => [
                  Text(
                    item.cod.toString(),
                    style: StylesTypography.h16Bold,
                  ),
                  Text(
                    item.name,
                    style: StylesTypography.h16Bold,
                  ),
                  Text(
                    item.quantity.toString(),
                    style: StylesTypography.h16Bold,
                  ),
                  Text(
                    'R\$ ${item.price.toStringAsFixed(2)}',
                    style: StylesTypography.h16Bold,
                  ),
                  Text(
                    'R\$ ${item.priceMount.toStringAsFixed(2)}',
                    style: StylesTypography.h16Bold,
                  ),
                ])
            .toList()
      ],
    );
  }

  Widget tableCard() {
    return TableCardComponent(
      onTap: (index) => print(controller.list.elementAt(index).price),
      listTableCardItem: controller.list
          .map(
            (element) => TableCardItem(
              iconTrailing: const Icon(Icons.arrow_right),
              title: "valor ${element.quantity.toString()}",
              leading: Text(element.name),
              tooltip: element.name.toString(),
            ),
          )
          .toList(),
    );
  }
}
