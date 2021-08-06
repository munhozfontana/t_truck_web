import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/map_component.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/components/table/table_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/enum/delivery_status_enum.dart';

import './truck_drivers_detail_controller.dart';

class TruckDriversDetailPage extends GetView<TruckDriversDetailController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleComponent(
          primary: TitleDetailComponent(
            title: controller.truckDriversEntity.value.truckDriver,
            subTitle: 'Código: ${controller.truckDriversEntity.value.cod}',
          ),
          secondary: const TitleRankComponent(
            totalQuantityDelivery: 'Total de entregas: 123',
            likes: 'Avaliações: 382',
            stars: 4,
          ),
        ),
        BodyComponent(
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: const [
                  Icon(Icons.place_outlined),
                  Text('Localização'),
                ],
              ),
              const Spacer(),
              Expanded(
                flex: 20,
                child: Hero(
                  tag: 'mapa-tag',
                  child: MapComponent(
                    onPositionChanged: (value) => controller.updateMap(value),
                    initialPosition: Get.arguments != null
                        ? (Get.arguments as LocationMapEntity)
                        : controller.currentPositonMap.value,
                    onTap: () => Get.toNamed('/home/mapa',
                        arguments: controller.currentPositonMap.value),
                    key: key,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(FeatherIcons.gitPullRequest),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Taguatinga - Águas Claras',
                            style: StylesTypography.h21.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Horário de chegada: 14:32',
                            style: StylesTypography.h16.copyWith(
                              color: Colors.black.withOpacity(.5),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(),
                ],
              ),
              const Spacer(),
              Expanded(
                flex: 20,
                child: Obx(
                  () => TableComponent(
                    header: const [
                      'Nº pedido',
                      'Cliente',
                      'NF',
                      'Status',
                      '',
                    ],
                    data: controller.list
                        .map((e) => [
                              Text(
                                e.numOrder.toString(),
                                style: StylesTypography.h16Bold,
                              ),
                              Text(
                                e.clientName,
                                style: StylesTypography.h16Bold,
                              ),
                              Text(
                                e.nf.toString(),
                                style: StylesTypography.h16Bold,
                              ),
                              TableCellComponent(
                                value: (e.status as DeliveryStatus).desc,
                                color: (e.status as DeliveryStatus).color,
                                typeCellComponent: TypeCellComponent.outline,
                                width: 180,
                              ),
                              SizedBox(
                                height: 30,
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () =>
                                        print('Pra algum lugar que não sei'),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Visualizar',
                                          style:
                                              StylesTypography.h14w500.copyWith(
                                            color: StylesColors.black
                                                .withOpacity(.4),
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
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}

class TitleRankComponent extends StatelessWidget {
  final String totalQuantityDelivery;
  final String likes;
  final int stars;

  const TitleRankComponent({
    Key? key,
    this.totalQuantityDelivery = '',
    this.likes = '',
    this.stars = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  totalQuantityDelivery,
                  style: StylesTypography.h16,
                  textAlign: TextAlign.end,
                ),
              ),
              Expanded(
                child: Text(
                  likes,
                  style: StylesTypography.h16,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              5,
              (index) => index + 1 <= stars
                  ? Icon(
                      Icons.star,
                      color: StylesColors.wellow,
                    )
                  : Icon(
                      Icons.star_outline,
                      color: StylesColors.wellow,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleDetailComponent extends StatelessWidget {
  final String title;
  final String subTitle;

  const TitleDetailComponent({
    Key? key,
    this.title = '',
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: StylesTypography.h24,
          ),
          Text(
            subTitle,
            style: StylesTypography.h16.copyWith(
                color: Colors.black.withOpacity(
              .5,
            )),
          ),
        ],
      ),
    );
  }
}
