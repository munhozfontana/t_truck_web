import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/config/ui/config/config_bindings.dart';
import 'package:t_truck_web/features/config/ui/config/config_page.dart';
import 'package:t_truck_web/features/devolution/devolution_list/devolution_list_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_list/ui/devolution_list/devolution_list_page.dart';
import 'package:t_truck_web/features/home/home_biding.dart';
import 'package:t_truck_web/features/home/ui/components/expanded_map_component.dart';
import 'package:t_truck_web/features/home/ui/home_page.dart';
import 'package:t_truck_web/features/login/login_biding.dart';
import 'package:t_truck_web/features/login/ui/login_page.dart';
import 'package:t_truck_web/features/message/message_list/message_list_bindings.dart';
import 'package:t_truck_web/features/message/message_list/ui/message_list/message_list_page.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/truck_drivers_list_biding.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/ui/truck_drivers_list_page.dart';

import '../core/components/menu/menu_model.dart';
import '../core/icons/menu_icons_icons.dart';

enum Routes {
  login,
  home,
  homeMap,
  truckDrivers,
  devolutions,
  message,
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
      case Routes.message:
        return '/message';
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
      case Routes.message:
        return MenuModel(
          text: 'Mensagens',
          path: Routes.message.path,
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

  dynamic get page {
    switch (this) {
      case Routes.login:
        return const LoginPage();
      case Routes.home:
        return const HomePage();
      case Routes.truckDrivers:
        return TruckDriversListPage();
      case Routes.homeMap:
        return const ExpandedMapComponent();
      case Routes.devolutions:
        return DevolutionListPage();
      case Routes.message:
        return MessageListPage();
      case Routes.config:
        return ConfigPage();
      default:
    }
  }

  Bindings? get biding {
    switch (this) {
      case Routes.login:
        return LoginBiding();
      case Routes.home:
        return HomeBiding();
      case Routes.truckDrivers:
        return TruckDriversListBiding();
      case Routes.devolutions:
        return DevolutionListBindings();
      case Routes.message:
        return MessageListBindings();
      case Routes.config:
        return ConfigBindings();
      case Routes.homeMap:
        // TODO: Handle this case.
        break;
      case Routes.developer:
        // TODO: Handle this case.
        break;
      case Routes.unknown:
        // TODO: Handle this case.
        break;
    }
  }
}
