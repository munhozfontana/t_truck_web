import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/home/home_biding.dart';
import 'package:t_truck_web/features/home/ui/components/expanded_map_component.dart';
import 'package:t_truck_web/features/home/ui/home_page.dart';
import 'package:t_truck_web/features/login/login_biding.dart';
import 'package:t_truck_web/features/login/ui/login_page.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_biding.dart';
import 'package:t_truck_web/features/truck_drivers/ui/truck_drivers_page.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

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
          page: () => TruckDriversPage(),
          transition: Transition.fadeIn,
          binding: TruckDriversBiding()),
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
