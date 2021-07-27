import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/components/menu/menu_item_component.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';

import '../../styles/style_colors.dart';

class MenuComponent extends GetWidget<MenuComponentController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: StylesColors.white,
      child: Column(
        children: [
          Expanded(
            flex: 88,
            child: logo(),
          ),
          Expanded(
            flex: 764,
            child: itemsMenu(),
          ),
          Expanded(
            flex: 48,
            child: linkExit(),
          ),
        ],
      ),
    );
  }

  Center linkExit() => Center(
        child: Text(
          'Sair',
          style: TextStyle(
            color: StylesColors.orange,
          ),
        ),
      );

  ListView itemsMenu() {
    final height = Get.mediaQuery.size.height * .05398;
    return ListView(
      children: controller.menusItem
          .map(
            (item) => MenuItemComponent(
              height: height,
              menuModel: item,
              onTap: (menuModel) => {
                controller.menuModel = menuModel,
                Get.find<HomeController>().addQuickAcces(menuModel),
              },
            ),
          )
          .toList(),
    );
  }

  Center logo() => Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SvgPicture.asset(
              'images/logo.svg',
              height: constraints.maxHeight * .6,
              semanticsLabel: 'Acme Logo',
            );
          },
        ),
      );
}
