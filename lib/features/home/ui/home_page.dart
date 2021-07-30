import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/map_component.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/features/home/ui/components/card_info_component.dart';
import 'package:t_truck_web/features/home/ui/components/quick_access_component.dart';

import '../../../core/components/body_component.dart';
import '../../../core/components/layout_component.dart';
import '../../../core/components/title_component.dart';
import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          child: Column(
            children: [
              const TitleComponent(title: 'Painel'),
              BodyComponent(
                child: Column(
                  children: [
                    Expanded(
                      flex: Responsive.isMobile(context) ? 150 : 177,
                      child: Obx(() => Responsive.isMobile(context)
                          ? ListView(
                              itemExtent:
                                  MediaQuery.of(context).size.width * .45,
                              scrollDirection: Axis.horizontal,
                              children: [
                                  CardInfo(
                                    dashBoardEntity:
                                        controller.dashboads.value.finished!,
                                  ),
                                  CardInfo(
                                    dashBoardEntity:
                                        controller.dashboads.value.pending!,
                                  ),
                                  CardInfo(
                                    dashBoardEntity:
                                        controller.dashboads.value.opened!,
                                  ),
                                  CardInfo(
                                    dashBoardEntity:
                                        controller.dashboads.value.devolutions!,
                                  ),
                                ])
                          : Row(
                              children: [
                                CardInfo(
                                  dashBoardEntity:
                                      controller.dashboads.value.finished!,
                                ),
                                const Spacer(flex: 33),
                                CardInfo(
                                  dashBoardEntity:
                                      controller.dashboads.value.pending!,
                                ),
                                const Spacer(flex: 33),
                                CardInfo(
                                  dashBoardEntity:
                                      controller.dashboads.value.opened!,
                                ),
                                const Spacer(flex: 33),
                                CardInfo(
                                  dashBoardEntity:
                                      controller.dashboads.value.devolutions!,
                                ),
                              ],
                            )),
                    ),
                    const Spacer(flex: 26),
                    Expanded(
                      flex: Responsive.isMobile(context) ? 450 : 300,
                      child: Hero(
                        tag: 'mapa-tag',
                        child: MapComponent(
                          onPositionChanged: (value) =>
                              controller.updateMap(value),
                          initialPosition: Get.arguments != null
                              ? (Get.arguments as LocationMapEntity)
                              : controller.currentPositonMap.value,
                          onTap: () => Get.toNamed('/home/mapa',
                              arguments: controller.currentPositonMap.value),
                          key: key,
                        ),
                      ),
                    ),
                    const Spacer(flex: 25),
                    const TitleComponent(
                      flex: 36,
                      title: 'Acesso rápido',
                    ),
                    const Spacer(flex: 44),
                    Expanded(
                      flex: Responsive.isMobile(context) ? 40 : 96,
                      child: LayoutBuilder(
                        builder: (_, BoxConstraints constraints) {
                          return GetX<MenuComponentController>(
                            init: MenuComponentController(),
                            initState: (_) {},
                            builder: (_) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) => SizedBox(
                                  width: constraints.maxWidth * .041066,
                                ),
                                itemCount: _.quickAcces.length,
                                itemBuilder: (context, index) =>
                                    QuickAccessComponent(
                                  constraints: constraints,
                                  icon: _.quickAcces[index].icon,
                                  label: _.quickAcces[index].text,
                                  onTap: () => Get.offAllNamed(
                                    _.quickAcces[index].path,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const Spacer(flex: 48),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
