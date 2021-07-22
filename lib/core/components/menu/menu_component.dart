import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/components/menu/menu_item_component.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';
import 'package:t_truck_web/features/home/ui/home_controller.dart';

import '../../styles/style_colors.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  _MenuComponentState createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  final MenuComponentController controller = Get.put(MenuComponentController());
  double? maxHeight;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<MenuModel> menusItem = [
    MenuModel(
      text: 'Painel',
      route: '/painel',
      icon: Icons.view_in_ar_outlined,
    ),
    MenuModel(
      text: 'Motoristas',
      route: '/motoristas',
      icon: MenuIcons.truck,
    ),
    MenuModel(
        text: 'Devoluções',
        route: '/devolucoes',
        icon: MenuIcons.subdirectory_arrow_right,
        iconInverted: true),
    MenuModel(
      text: 'Mensagens',
      route: '/mensagens',
      icon: Icons.chat_bubble_outline,
    ),
    MenuModel(
      text: 'Configurações',
      route: '/configuracoes',
      icon: Icons.settings_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
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
    final height = maxHeight! * .053985;
    return ListView(
      children: menusItem
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
