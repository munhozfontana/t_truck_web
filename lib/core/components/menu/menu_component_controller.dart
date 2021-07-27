import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';

class MenuComponentController extends GetxController {
  RxDouble? maxHeight;

  final RxList<MenuModel> quickAcces = <MenuModel>[].obs;

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

  final _menuModel = MenuModel(
          text: 'Painel', route: '/painel', icon: Icons.view_in_ar_outlined)
      .obs;

  set menuModel(MenuModel newMenuModel) {
    _menuModel.value = newMenuModel;
  }

  MenuModel get menuModel => _menuModel.value;

  void addQuickAcces(MenuModel menuModel) {
    if (quickAcces.isEmpty || !quickAcces.any((item) => item == menuModel)) {
      quickAcces.insert(0, menuModel);
    }

    if (quickAcces.length >= 5) {
      quickAcces.removeLast();
    }
  }
}
