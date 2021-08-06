import 'package:flutter/material.dart';

import '../core/components/menu/menu_model.dart';
import '../core/icons/menu_icons_icons.dart';

enum Routes {
  login,
  home,
  homeMap,
  truckDrivers,
  devolutions,
  messages,
  config,
  developer,
  unknown
}

extension RoutesExt on Routes {
  String get path {
    switch (this) {
      case Routes.login:
        return '/';
      case Routes.home:
        return '/home';
      case Routes.truckDrivers:
        return '/truck_drivers';
      case Routes.homeMap:
        return '/home/mapa';
      case Routes.devolutions:
        return '/devolutions';
      case Routes.messages:
        return '/messages';
      case Routes.config:
        return '/config';
      default:
        return '/unknown';
    }
  }

  MenuModel get menu {
    switch (this) {
      case Routes.home:
        return MenuModel(
          text: 'Painel',
          path: Routes.home.path,
          icon: Icons.view_in_ar_outlined,
        );
      case Routes.truckDrivers:
        return MenuModel(
          text: 'Motoristas',
          path: Routes.truckDrivers.path,
          icon: MenuIcons.truck,
        );
      case Routes.devolutions:
        return MenuModel(
            text: 'Devoluções',
            path: Routes.devolutions.path,
            icon: MenuIcons.subdirectory_arrow_right,
            iconInverted: true);
      case Routes.messages:
        return MenuModel(
          text: 'Mensagens',
          path: Routes.messages.path,
          icon: Icons.chat_bubble_outline,
        );
      case Routes.config:
        return MenuModel(
          text: 'Configurações',
          path: Routes.config.path,
          icon: Icons.settings_outlined,
        );
      default:
        return MenuModel(
          text: 'Painel',
          path: Routes.home.path,
          icon: Icons.view_in_ar_outlined,
        );
    }
  }
}
