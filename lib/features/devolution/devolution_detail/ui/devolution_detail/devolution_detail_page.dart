import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

import './devolution_detail_controller.dart';

class DevolutionDetailPage extends GetView<DevolutionDetailController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Cliente: Super Adega Atacadista',
                textAlign: TextAlign.justify,
                style: StylesTypography.h18,
              ),
              Text(
                'Motivo nº 17',
                style: StylesTypography.h24,
              ),
              Text(
                'Devolução Completa,\nitens não corresponde com a NF.',
                style: StylesTypography.h16W400,
              ),
              Text(
                'Data da devolução: 18/05/2021 - 10:45',
                style: StylesTypography.h16W400.copyWith(
                  color: StylesColors.black.withOpacity(.5),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: TableComponent(
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
                          'R\$ ${item.price}',
                          style: StylesTypography.h16Bold,
                        ),
                        Text(
                          'R\$ ${item.priceMount}',
                          style: StylesTypography.h16Bold,
                        ),
                      ])
                  .toList()
            ],
          ),
        )
      ],
    );
  }
}
