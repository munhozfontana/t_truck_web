import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_card_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

import 'image_quality_list_controller.dart';

class ImageQualityListPage extends GetView<ImageQualityListController> {
  const ImageQualityListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        children: [
          Visibility(
            visible: Responsive.isNotMobile(context),
            child: const TitleComponent(
              title: 'Qualidade de imagem',
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
              title: element.name,
              leading:
                  Text('${element.overallPercentage} - ${element.badQuality}'),
              tooltip: element.cod.toString(),
            ),
          )
          .toList(),
    );
  }

  TableComponent table() {
    return TableComponent(
      header: const [
        'Cod Motorista',
        'Nome',
        'Percentual',
        'Imagens ruins',
        '',
      ],
      space: const [
        2,
        3,
        1,
        1,
        1,
      ],
      data: controller.list
          .map((e) => [
                Text(
                  e.cod.toString(),
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.name,
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  '${e.overallPercentage}%',
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.badQuality.toString(),
                  style: StylesTypography.h16Bold,
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
