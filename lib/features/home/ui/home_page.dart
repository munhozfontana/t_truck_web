import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/animations/animations_utils.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/features/map/map_page.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import '../../../core/components/body_component.dart';
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
    return LayoutComponent(
      child: Column(
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
                            dashBoardEntity:
                                controller.dashboads.value.finished,
                          ),
                          const Spacer(flex: 33),
                          CardInfo(
                            dashBoardEntity: controller.dashboads.value.pending,
                          ),
                          const Spacer(flex: 33),
                          CardInfo(
                            dashBoardEntity: controller.dashboads.value.opened,
                          ),
                          const Spacer(flex: 33),
                          CardInfo(
                            dashBoardEntity:
                                controller.dashboads.value.devolutions,
                          ),
                        ],
                      ),
                      child: ListView(
                        itemExtent: MediaQuery.of(context).size.width * .40,
                        scrollDirection: Axis.horizontal,
                        children: [
                          CardInfo(
                            dashBoardEntity:
                                controller.dashboads.value.finished,
                          ),
                          CardInfo(
                            dashBoardEntity: controller.dashboads.value.pending,
                          ),
                          CardInfo(
                            dashBoardEntity: controller.dashboads.value.opened,
                          ),
                          CardInfo(
                            dashBoardEntity:
                                controller.dashboads.value.devolutions,
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
                    child: MapPage(
                      onTap: () => Get.toNamed(Routes.homeMap.path,
                          arguments: controller.currentPositonMap.value),
                      // key: key,
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
                            itemBuilder: (context, index) =>
                                QuickAccessComponent(
                              constraints: constraints,
                              icon: _.quickAcces[index].menu.icon,
                              label: _.quickAcces[index].menu.text,
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
    );
  }
}

class PositionMap extends StatefulWidget {
  final String message;

  const PositionMap({Key? key, this.message = "Sem descrição"})
      : super(key: key);

  @override
  _PositionMapState createState() => _PositionMapState();
}

class _PositionMapState extends State<PositionMap>
    with TickerProviderStateMixin {
  double size = 50;

  late AnimationController _sonarController;
  AnimationsUtils animationsUtils = AnimationsUtils();

  @override
  void initState() {
    super.initState();

    _sonarController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _sonarController.repeat();
  }

  @override
  void dispose() {
    _sonarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Tooltip(
          verticalOffset: -40,
          message: widget.message,
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
            ),
            child: SvgPicture.asset(
              "images/truck_gsa.svg",
            ),
          ),
        ),
      ],
    );
  }
}
