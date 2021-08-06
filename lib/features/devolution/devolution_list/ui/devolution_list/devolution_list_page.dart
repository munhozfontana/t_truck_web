import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_button.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/entities/enum/devolution_status_enum.dart';

import './devolution_list_controller.dart';

class DevolutionListPage extends GetView<DevolutionListController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleComponent(
          primary: Expanded(
            flex: 3,
            child: Text(
              'Devoluções',
              style: StylesTypography.h24,
            ),
          ),
          secondary: SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: StylesButton.grayButton,
              icon: Icon(
                FeatherIcons.plusCircle,
                color: StylesColors.black,
              ),
              label: Text(
                'Enviar mensagem',
                style: StylesTypography.h16.copyWith(
                  color: StylesColors.black,
                ),
              ),
            ),
          ),
        ),
        BodyComponent(
          child: Obx(
            () => TableComponent(
              header: const [
                'Nº',
                'Cliente',
                'Status',
                '',
              ],
              data: controller.list
                  .map((e) => [
                        Text(
                          e.cod.toString(),
                          style: StylesTypography.h16Bold,
                        ),
                        Text(
                          e.client,
                          style: StylesTypography.h16Bold,
                        ),
                        TableCellComponent(
                          value: e.devolutionStatus.desc,
                          color: e.devolutionStatus.color,
                          typeCellComponent: TypeCellComponent.outline,
                          width: 180,
                        ),
                        SizedBox(
                          height: 30,
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => controller.toDriverDetail(e),
                              child: Row(
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
            ),
          ),
        )
      ],
    );
  }
}
