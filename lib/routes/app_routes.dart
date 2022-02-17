import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/config/ui/config/config_page.dart';
import 'package:t_truck_web/features/config/ui/config_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/devolution_detail_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/ui/devolution_detail/devolution_detail_page.dart';
import 'package:t_truck_web/features/devolution/devolution_list/devolution_list_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_list/ui/devolution_list/devolution_list_page.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/image_quality_detail_bindings.dart';
import 'package:t_truck_web/features/image_quality/image_quality_detail/ui/image_quality_detail_page.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/image_quality_list_bindings.dart';
import 'package:t_truck_web/features/image_quality/image_quality_list/ui/image_quality_list_page.dart';
import 'package:t_truck_web/features/map/map_page.dart';
import 'package:t_truck_web/features/message/message_detail/message_detail_bindings.dart';
import 'package:t_truck_web/features/message/message_detail/ui/message_detail/message_detail_page.dart';
import 'package:t_truck_web/features/message/message_list/message_list_bindings.dart';
import 'package:t_truck_web/features/message/message_list/ui/message_list/message_list_page.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/truck_drivers_detail_bindings.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/ui/truck_drivers_detail_page.dart';

import '../core/styles/styles_fonts.dart';
import '../features/home/home_biding.dart';
import '../features/home/ui/home_page.dart';
import '../features/login/login_biding.dart';
import '../features/login/ui/login_page.dart';
import '../features/truck_drivers/truck_drivers_list/truck_drivers_list_biding.dart';
import '../features/truck_drivers/truck_drivers_list/ui/truck_drivers_list_page.dart';
import 'app_routes_enum.dart';

const slow = Duration(milliseconds: 800);
const fast = Duration(milliseconds: 400);

List<GetPage> pages() {
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
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.homeMap.path,
      transitionDuration: slow,
      curve: Curves.easeInOutCirc,
      page: () => Hero(
        tag: 'mapa-tag',
        child: MapPage(
          onTap: () => Get.back(),
        ),
      ),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.config.path,
      transitionDuration: slow,
      curve: Curves.easeInOutCirc,
      page: () => ConfigPage(),
      transition: Transition.fadeIn,
      binding: ConfigBindings(),
    ),
    ..._truckDriversModule(),
    ..._devolutionsModule(),
    ..._messageModule(),
    ..._imageQualityModule(),
    GetPage(
      name: Routes.developer.path,
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => Center(
        child: Text(
          '404',
          style: StylesTypography.h48,
        ),
      ),
      transition: Transition.fadeIn,
    ),
  ];
  return list;
}

List<GetPage<dynamic>> _devolutionsModule() {
  return [
    GetPage(
      name: Routes.devolutions.path,
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => DevolutionListPage(),
      transition: Transition.fadeIn,
      binding: DevolutionListBindings(),
    ),
    GetPage(
      name: '${Routes.devolutions.path}/:id',
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => DevolutionDetailPage(),
      transition: Transition.rightToLeft,
      binding: DevolutionDetailBindings(),
    ),
  ];
}

List<GetPage<dynamic>> _truckDriversModule() {
  return [
    GetPage(
      name: Routes.truckDrivers.path,
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => TruckDriversListPage(),
      transition: Transition.fadeIn,
      binding: TruckDriversListBiding(),
    ),
    GetPage(
      name: '${Routes.truckDrivers.path}/:id',
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => TruckDriversDetailPage(),
      transition: Transition.rightToLeft,
      binding: TruckDriversDetailBindings(),
    ),
  ];
}

List<GetPage<dynamic>> _messageModule() {
  return [
    GetPage(
      name: Routes.message.path,
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => MessageListPage(),
      transition: Transition.fadeIn,
      binding: MessageListBindings(),
    ),
    GetPage(
      name: '${Routes.message.path}/:id',
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => MessageDetailPage(),
      transition: Transition.rightToLeft,
      binding: MessageDetailBindings(),
    ),
  ];
}

List<GetPage<dynamic>> _imageQualityModule() {
  return [
    GetPage(
      name: Routes.imageQuality.path,
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => const ImageQualityListPage(),
      transition: Transition.fadeIn,
      binding: ImageQualityListBindings(),
    ),
    GetPage(
      name: '${Routes.imageQuality.path}/:id',
      transitionDuration: fast,
      curve: Curves.easeInOutCirc,
      page: () => const ImageQualityDetailPage(),
      transition: Transition.rightToLeft,
      binding: ImageQualityDetailBindings(),
    ),
  ];
}
