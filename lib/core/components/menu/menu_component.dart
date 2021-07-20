import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_item_component.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
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
  double? maxHeight;

  List<MenuModel> menusItem = [
    MenuModel(
      text: 'Painel',
      route: '/painel',
      icon: Icons.view_in_ar_outlined,
    ),
    MenuModel(
      text: 'Motoristas',
      route: '/motoristas',
      icon: FontAwesomeIcons.truck,
    ),
    MenuModel(
      text: 'Devoluções',
      route: '/devolucoes',
      icon: Icons.backup_outlined,
    ),
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
    final height = maxHeight! * .05398;
    return ListView(
      children: menusItem
          .map(
            (item) => MenuItemComponent(
              height: height,
              menuModel: item,
              onTap: (menuModel) =>
                  Get.find<HomeController>().addQuickAcces(menuModel),
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
