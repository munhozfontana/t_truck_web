import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/style_colors.dart';
import 'menu_item_component.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  _MenuComponentState createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  double? maxHeight;

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
      children: [
        MenuItemComponent(
          height: height,
          icon: Icons.add_box_outlined,
          text: 'Painel',
        ),
        MenuItemComponent(
          height: height,
          icon: Icons.carpenter_outlined,
          text: 'Motoristas',
        ),
        MenuItemComponent(
          height: height,
          icon: Icons.backup_outlined,
          text: 'Devoluções',
        ),
        MenuItemComponent(
          height: height,
          icon: Icons.card_travel_outlined,
          text: 'Mensagens',
        ),
        MenuItemComponent(
          height: height,
          icon: Icons.engineering_outlined,
          text: 'Configurações',
        ),
      ],
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
