import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';
import 'package:t_truck_web/features/home/home_biding.dart';
import 'package:t_truck_web/features/home/ui/components/expanded_map_component.dart';
import 'package:t_truck_web/features/home/ui/home_page.dart';
import 'package:t_truck_web/features/login/login_biding.dart';
import 'package:t_truck_web/features/login/ui/login_page.dart';
import 'package:t_truck_web/features/truck_drivers/ui/truck_drivers_page.dart';

enum Routes { login, home, homeMap, truckDrivers, unknown }

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
      case Routes.unknown:
        return '/unknown';
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
      //  MenuModel(
      //     text: 'Devoluções',
      //     route: '/devolucoes',
      //     icon: MenuIcons.subdirectory_arrow_right,
      //     iconInverted: true),
      // MenuModel(
      //   text: 'Mensagens',
      //   route: '/mensagens',
      //   icon: Icons.chat_bubble_outline,
      // ),
      // MenuModel(
      //   text: 'Configurações',
      //   route: '/configuracoes',
      //   icon: Icons.settings_outlined,
      // ),
      default:
        return MenuModel(
          text: 'Painel',
          path: Routes.home.path,
          icon: Icons.view_in_ar_outlined,
        );
    }
  }
}

const slowTransition = Duration(milliseconds: 800);

class AppPages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: Routes.login.path,
        transitionDuration: slowTransition,
        page: () => const LoginPage(),
        binding: LoginBiding(),
      ),
      GetPage(
        name: Routes.home.path,
        transitionDuration: slowTransition,
        page: () => const HomePage(),
        binding: HomeBiding(),
      ),
      GetPage(
        transitionDuration: slowTransition,
        name: Routes.homeMap.path,
        page: () => const ExpandedMapComponent(),
      ),
      GetPage(
        transitionDuration: slowTransition,
        name: Routes.truckDrivers.path,
        page: () => TruckDriversPage(),
      ),
    ];
  }

  static bool isExpandedMap() {
    return Routes.homeMap.path == Get.currentRoute;
  }

  static bool isHomeMap() {
    return Routes.login.path == Get.currentRoute;
  }
}
