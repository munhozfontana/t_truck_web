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

import 'image_quality_detail_controller.dart';

class ImageQualityDetailPage extends GetView<ImageQualityDetailController> {
  const ImageQualityDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Stack(
        children: [
          Column(
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
              ),
            ],
          ),
          Obx(() => Visibility(
              visible: controller.loadingImage.value,
              child: const Align(
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(),
                ),
              ))),
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
              title: element.numTrasnvenda,
              leading: Text('${element.numCanhoto} - ${element.codCLi}'),
              tooltip: element.numTrasnvenda,
            ),
          )
          .toList(),
    );
  }

  TableComponent table() {
    return TableComponent(
      header: const [
        'Nº TrasnVenda',
        'Cod Cli',
        'Nº Canhoto',
        'Percentual',
        '',
      ],
      space: const [
        3,
        1,
        2,
        1,
        1,
      ],
      data: controller.list
          .map((e) => [
                Text(
                  e.numTrasnvenda,
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.codCLi.toString(),
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.numCanhoto.toString(),
                  style: StylesTypography.h16Bold,
                ),
                Text(
                  e.percentage.toString(),
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
                            'Abrir imagem',
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
