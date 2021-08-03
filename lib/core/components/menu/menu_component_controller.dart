import 'package:get/get.dart';

import '../../../routes/app_routes_enum.dart';
import 'menu_model.dart';

mixin IMenuComponentController {
  void addQuickAcces(MenuModel menuModel);
  void onTapMenu(MenuModel newMenuModel);
}

class MenuComponentController extends GetxController
    implements IMenuComponentController {
  RxDouble? maxHeight;

  final RxList<MenuModel> quickAcces = <MenuModel>[].obs;

  RxList<MenuModel> menusItem = [
    Routes.home.menu,
    Routes.truckDrivers.menu,
    Routes.devolutions.menu,
    Routes.messages.menu,
    Routes.config.menu,
  ].obs;

  final Rx<MenuModel> _menuModel = Routes.home.menu.obs;

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

  void onTapMenu(MenuModel newMenuModel) {
    menuModel = newMenuModel;
    addQuickAcces(newMenuModel);
    Get.offAllNamed(newMenuModel.path);
  }
}
