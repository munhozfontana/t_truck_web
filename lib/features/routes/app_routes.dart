import 'package:get/get.dart';
import 'package:t_truck_web/features/home/home_biding.dart';
import 'package:t_truck_web/features/home/ui/components/expanded_map_component.dart';
import 'package:t_truck_web/features/home/ui/home_page.dart';
import 'package:t_truck_web/features/login/login_biding.dart';
import 'package:t_truck_web/features/login/ui/login_page.dart';
import 'package:t_truck_web/features/truck_drivers/ui/truck_drivers_page.dart';

enum Routes { login, home, homeMap, truckDrivers }

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
      default:
        return '/';
    }
  }
}

const durationTransitionsPages = Duration(milliseconds: 1000);

class AppPages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: Routes.login.path,
        page: () => const LoginPage(),
        binding: LoginBiding(),
      ),
      GetPage(
        name: Routes.home.path,
        transitionDuration: durationTransitionsPages,
        page: () => const HomePage(),
        binding: HomeBiding(),
      ),
      GetPage(
        transitionDuration: durationTransitionsPages,
        name: Routes.homeMap.path,
        page: () => const ExpandedMapComponent(),
      ),
      GetPage(
        transitionDuration: durationTransitionsPages,
        name: Routes.truckDrivers.path,
        page: () => TruckDriversPage(),
      ),
    ];
  }

  static bool isLogin() {
    return Routes.login.path == Get.currentRoute;
  }
}
