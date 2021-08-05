import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/truck_drivers_detail_bindings.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/ui/truck_drivers_detail_page.dart';

import '../core/components/layout_component.dart';
import '../core/styles/styles_fonts.dart';
import '../features/home/home_biding.dart';
import '../features/home/ui/components/expanded_map_component.dart';
import '../features/home/ui/home_page.dart';
import '../features/login/login_biding.dart';
import '../features/login/ui/login_page.dart';
import '../features/truck_drivers/truck_drivers_list/truck_drivers_list_biding.dart';
import '../features/truck_drivers/truck_drivers_list/ui/truck_drivers_list_page.dart';
import 'app_routes_enum.dart';

const slow = Duration(milliseconds: 800);
const fast = Duration(milliseconds: 400);

class AppPages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: Routes.login.path,
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => const LoginPage(),
        binding: LoginBiding(),
      ),
      GetPage(
        name: Routes.home.path,
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        binding: HomeBiding(),
        page: () => const HomePage(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: Routes.homeMap.path,
        transitionDuration: slow,
        curve: Curves.easeInOutCirc,
        page: () => const ExpandedMapComponent(),
        transition: Transition.fadeIn,
      ),
      GetPage(
          name: Routes.truckDrivers.path,
          transitionDuration: fast,
          curve: Curves.easeInOutCirc,
          page: () => TruckDriversListPage(),
          transition: Transition.fadeIn,
          binding: TruckDriversListBiding()),
      GetPage(
          name: '${Routes.truckDrivers.path}/:id',
          transitionDuration: fast,
          curve: Curves.easeInOutCirc,
          page: () => TruckDriversDetailPage(),
          transition: Transition.fadeIn,
          binding: TruckDriversDetailBindings()),
      GetPage(
        name: Routes.developer.path,
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(
          child: Center(
            child: Text(
              'Em Desenvolvimento',
              style: StylesTypography.h48,
            ),
          ),
        ),
        transition: Transition.fadeIn,
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
