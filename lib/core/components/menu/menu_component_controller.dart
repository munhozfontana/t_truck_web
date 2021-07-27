import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';
import 'package:t_truck_web/routes/app_routes.dart';

class MenuComponentController extends GetxController {
  RxDouble? maxHeight;

  final RxList<MenuModel> quickAcces = <MenuModel>[].obs;

  RxList<MenuModel> menusItem = [
    Routes.home.menu,
    Routes.truckDrivers.menu,
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
