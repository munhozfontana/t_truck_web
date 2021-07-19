import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_truck_web/core/components/menu/menu_item_component.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';

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
      route: '/a',
      icon: Icons.add_box_outlined,
    ),
    MenuModel(
      text: 'Motoristas',
      route: '/a',
      icon: Icons.carpenter_outlined,
    ),
    MenuModel(
      text: 'Devoluções',
      route: '/a',
      icon: Icons.backup_outlined,
    ),
    MenuModel(
      text: 'Mensagens',
      route: '/a',
      icon: Icons.card_travel_outlined,
    ),
    MenuModel(
      text: 'Configurações',
      route: '/a',
      icon: Icons.engineering_outlined,
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
