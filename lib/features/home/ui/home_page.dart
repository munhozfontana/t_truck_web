import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/body_component.dart';
import '../../../core/components/map_component.dart';
import '../../../core/components/menu/menu_component_controller.dart';
import '../../../core/components/responsive.dart';
import '../../../core/components/title_component.dart';
import 'components/card_info_component.dart';
import 'components/quick_access_component.dart';
import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleComponent(
          title: 'Painel',
        ),
        BodyComponent(
          child: Column(
            children: [
              Visibility(
                visible: Responsive.isMobile(context),
                child: const Spacer(flex: 26),
              ),
              Expanded(
                flex: Responsive.isMobile(context) ? 180 : 177,
                child: Obx(
                  () => Visibility(
                    visible: Responsive.isMobile(context),
                    replacement: Row(
                      children: [
                        CardInfo(
                          dashBoardEntity: controller.dashboads.value.finished!,
                        ),
                        const Spacer(flex: 33),
                        CardInfo(
                          dashBoardEntity: controller.dashboads.value.pending!,
                        ),
                        const Spacer(flex: 33),
                        CardInfo(
                          dashBoardEntity: controller.dashboads.value.opened!,
                        ),
                        const Spacer(flex: 33),
                        CardInfo(
                          dashBoardEntity:
                              controller.dashboads.value.devolutions!,
                        ),
                      ],
                    ),
                    child: ListView(
                      itemExtent: MediaQuery.of(context).size.width * .40,
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardInfo(
                          dashBoardEntity: controller.dashboads.value.finished!,
                        ),
                        CardInfo(
                          dashBoardEntity: controller.dashboads.value.pending!,
                        ),
                        CardInfo(
                          dashBoardEntity: controller.dashboads.value.opened!,
                        ),
                        CardInfo(
                          dashBoardEntity:
                              controller.dashboads.value.devolutions!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 26),
              Expanded(
                flex: Responsive.isMobile(context) ? 300 : 300,
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
              const Spacer(flex: 25),
              Visibility(
                visible: Responsive.isNotMobile(context),
                child: const TitleComponent(
                  flex: 36,
                  title: 'Acesso rápido',
                ),
              ),
              const Spacer(flex: 44),
              Expanded(
                flex: 96,
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
                          itemBuilder: (context, index) => QuickAccessComponent(
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
    );
  }
}
