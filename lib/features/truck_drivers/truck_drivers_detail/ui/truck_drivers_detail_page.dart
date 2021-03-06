import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../../../core/components/body_component.dart';
import '../../../../core/components/collap_list.dart';
import '../../../../core/components/layout_component.dart';
import '../../../../core/components/responsive.dart';
import '../../../../core/components/table/table_card_component.dart';
import '../../../../core/components/table/table_cell_component.dart';
import '../../../../core/components/table/table_component.dart';
import '../../../../core/components/title_component.dart';
import '../../../../core/styles/style_colors.dart';
import '../../../../core/styles/styles_fonts.dart';
import '../../../map/map_page.dart';
import '../../truck_drivers_list/domain/entities/delivery_status_enum.dart';
import 'truck_drivers_detail_controller.dart';

class TruckDriversDetailPage extends GetView<TruckDriversDetailController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Responsive.when(
        context,
        mobile: onScroll(context),
        orOther: notScroll(context),
      ),
    );
  }

  Widget onScroll(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CollapList(
      slivers: [
        CollapList.makeHeader(
          titleComponent(context),
          maxHeight: size.height * .15,
        ),
        CollapList.makeHeader(
          bodyComponent(context),
          maxHeight: size.height,
        ),
      ],
    );
  }

  Column notScroll(BuildContext context) {
    return Column(
      children: [
        titleComponent(context),
        bodyComponent(context),
      ],
    );
  }

  BodyComponent bodyComponent(BuildContext context) {
    return BodyComponent(
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
            child: HeroMode(
              enabled: false,
              child: Hero(
                tag: 'mapa-tag',
                child: MapPage(onTap: () => Get.back()),
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
                        style: Responsive.when(
                          context,
                          mobile: StylesTypography.h18.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          orOther: StylesTypography.h21.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Horário de chegada: 14:32',
                        style: Responsive.when(
                          context,
                          mobile: StylesTypography.h14.copyWith(
                            color: Colors.black.withOpacity(.5),
                          ),
                          orOther: StylesTypography.h16.copyWith(
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(),
            ],
          ),
          const Spacer(),
          Expanded(
            flex: Responsive.when(context, mobile: 50, orOther: 20),
            child: Obx(
              () => Responsive.when(
                context,
                mobile: tableCard(),
                orOther: table(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget titleComponent(BuildContext context) {
    return Obx(() {
      return TitleComponent(
        primary: TitleDetailComponent(
          title: controller.truckDriversEntity.value.truckDriver,
          subTitle: 'Código: ${controller.truckDriversEntity.value.cod}',
        ),
        secondary: TitleRankComponent(
          totalQuantityDelivery: Responsive.when(
            context,
            mobile: 'Entregas:  ${controller.quantity}',
            orOther: 'Total de entregas: ${controller.quantity}',
          ),
          likes: 'Avaliações: 382',
          stars: 4,
        ),
      );
    });
  }

  TableComponent table() {
    return TableComponent(
      header: const [
        'Nº pedido',
        'Cliente',
        'NF',
        'Status',
        '',
      ],
      space: const [
        1,
        4,
        1,
        2,
        1,
      ],
      data: controller.list
          .map(
            (e) => [
              Text(
                e.numOrder.toString(),
                style: StylesTypography.h16Bold,
              ),
              Text(
                e.clientName,
                style: StylesTypography.h16Bold,
              ),
              Text(
                e.quantity.toString(),
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
            ],
          )
          .toList(),
    );
  }

  Widget tableCard() {
    return TableCardComponent(
      onTap: print,
      listTableCardItem: controller.list
          .map(
            (element) => TableCardItem(
              iconTrailing: const Icon(Icons.arrow_right),
              title: element.clientName,
              leading: element.status.icon,
              tooltip: element.status.desc,
            ),
          )
          .toList(),
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
      flex: Responsive.when(context, mobile: 7, orOther: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  totalQuantityDelivery,
                  style: Responsive.when(
                    context,
                    mobile: StylesTypography.h14,
                    orOther: StylesTypography.h16,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Expanded(
                child: Text(
                  likes,
                  style: Responsive.when(
                    context,
                    mobile: StylesTypography.h14,
                    orOther: StylesTypography.h16,
                  ),
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
      flex: Responsive.when(context, mobile: 5, orOther: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Responsive.when(
              context,
              mobile: StylesTypography.h16Bold,
              orOther: StylesTypography.h24,
            ),
          ),
          Text(
            subTitle,
            style: Responsive.when(
              context,
              mobile: StylesTypography.h14.copyWith(
                color: Colors.black.withOpacity(
                  .5,
                ),
              ),
              orOther: StylesTypography.h16.copyWith(
                color: Colors.black.withOpacity(
                  .5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
