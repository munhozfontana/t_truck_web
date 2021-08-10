import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_card_component.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_button.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/message/message_list/domain/entities/message_entity_enum.dart';

import './message_list_controller.dart';

class MessageListPage extends GetView<MessageListController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Responsive.when<double>(
          context,
          mobile: 8,
          orOther: 0,
        ),
      ),
      child: Column(
        children: [
          TitleComponent(
            flex: Responsive.when(
              context,
              mobile: 1,
              orOther: 2,
            ),
            primary: Visibility(
              visible: Responsive.isNotMobile(context),
              child: Expanded(
                flex: 3,
                child: Text(
                  'Devoluções',
                  style: StylesTypography.h24,
                ),
              ),
            ),
            secondary: SizedBox(
              height: 50,
              width: Responsive.when<double>(
                context,
                desktop: 250,
                mobile: 120,
                tablet: 250,
                orOther: 250,
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: StylesButton.grayButton,
                icon: Icon(
                  FeatherIcons.plusCircle,
                  color: StylesColors.black,
                ),
                label: Text(
                  Responsive.when<String>(
                    context,
                    desktop: 'Enviar mensagem',
                    mobile: 'Enviar',
                    tablet: 'Enviar mensagem',
                    orOther: '',
                  ),
                  style: StylesTypography.h16.copyWith(
                    color: StylesColors.black,
                  ),
                ),
              ),
            ),
          ),
          BodyComponent(
            child: Obx(
              () => Responsive.whenWidget(
                context,
                desktop: table(),
                tablet: table(),
                mobile: tableCard(),
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
              title: element.subject,
              leading: element.status.icon,
              tooltip: element.status.desc,
            ),
          )
          .toList(),
    );
  }

  TableComponent table() {
    return TableComponent(
      header: const [
        'Nº',
        'Assunto',
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
                  e.subject,
                  style: StylesTypography.h16Bold,
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
}
