import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';

import '../../../routes/app_routes_enum.dart';

class MenuComponentController extends GetxController {
  RxDouble? maxHeight;

  final RxList<Routes> quickAcces = <Routes>[].obs;
  final ILoggedUser iLoggedUser;

  RxList<Routes> menusItem = [
    Routes.home,
    Routes.truckDrivers,
    Routes.devolutions,
    Routes.message,
    Routes.config,
  ].obs;

  final Rx<Routes> _menuModel = Routes.home.obs;

  MenuComponentController({
    required this.iLoggedUser,
  });

  set menuModel(Routes newMenuModel) {
    _menuModel.value = newMenuModel;
  }

  Routes get menuModel => _menuModel.value;

  void addQuickAcces(Routes menuModel) {
    if (quickAcces.isEmpty || !quickAcces.any((item) => item == menuModel)) {
      quickAcces.insert(0, menuModel);
    }

    if (quickAcces.length >= 5) {
      quickAcces.removeLast();
    }
  }

  void onTapMenu(Routes newMenuModel) {
    menuModel = newMenuModel;
    addQuickAcces(newMenuModel);
    if (!Get.currentRoute.contains(newMenuModel.path)) {
      Get.offAllNamed(newMenuModel.path);
    } else if (Get.currentRoute.contains(RegExp(r'[0-9]'))) {
      Get.back();
    }
  }

  void logout() {
    iLoggedUser.logout();
  }
}
