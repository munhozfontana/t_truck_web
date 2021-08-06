import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/devolution_detail_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/ui/devolution_detail/devolution_detail_page.dart';
import 'package:t_truck_web/features/devolution/devolution_list/devolution_list_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_list/ui/devolution_list/devolution_list_page.dart';
import 'package:t_truck_web/features/message/message_detail/message_detail_bindings.dart';
import 'package:t_truck_web/features/message/message_detail/ui/message_detail/message_detail_page.dart';
import 'package:t_truck_web/features/message/message_list/message_list_bindings.dart';
import 'package:t_truck_web/features/message/message_list/ui/message_list/message_list_page.dart';
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
    final list = [
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
        page: () => const LayoutComponent(child: HomePage()),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: Routes.homeMap.path,
        transitionDuration: slow,
        curve: Curves.easeInOutCirc,
        page: () => const ExpandedMapComponent(),
        transition: Transition.fadeIn,
      ),
      ...truckDriversModule(),
      ...devolutionsModule(),
      ...messageModule(),
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
    return list;
  }

  static List<GetPage<dynamic>> devolutionsModule() {
    return [
      GetPage(
        name: Routes.devolutions.path,
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(child: DevolutionListPage()),
        transition: Transition.fadeIn,
        binding: DevolutionListBindings(),
      ),
      GetPage(
        name: '${Routes.devolutions.path}/:id',
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(child: DevolutionDetailPage()),
        transition: Transition.rightToLeft,
        binding: DevolutionDetailBindings(),
      ),
    ];
  }

  static List<GetPage<dynamic>> truckDriversModule() {
    return [
      GetPage(
        name: Routes.truckDrivers.path,
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(child: TruckDriversListPage()),
        transition: Transition.fadeIn,
        binding: TruckDriversListBiding(),
      ),
      GetPage(
        name: '${Routes.truckDrivers.path}/:id',
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(child: TruckDriversDetailPage()),
        transition: Transition.rightToLeft,
        binding: TruckDriversDetailBindings(),
      ),
    ];
  }

  static List<GetPage<dynamic>> messageModule() {
    return [
      GetPage(
        name: Routes.message.path,
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(child: MessageListPage()),
        transition: Transition.fadeIn,
        binding: MessageListBindings(),
      ),
      GetPage(
        name: '${Routes.message.path}/:id',
        transitionDuration: fast,
        curve: Curves.easeInOutCirc,
        page: () => LayoutComponent(child: MessageDetailPage()),
        transition: Transition.rightToLeft,
        binding: MessageDetailBindings(),
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
