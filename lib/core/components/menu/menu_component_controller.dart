import 'package:get/get.dart';

import '../../../routes/app_routes_enum.dart';

mixin IMenuComponentController {
  void addQuickAcces(Routes menuModel);
  void onTapMenu(Routes newMenuModel);
}

class MenuComponentController extends GetxController
    implements IMenuComponentController {
  RxDouble? maxHeight;

  final RxList<Routes> quickAcces = <Routes>[].obs;

  RxList<Routes> menusItem = [
    Routes.home,
    Routes.truckDrivers,
    Routes.devolutions,
    Routes.message,
    Routes.config,
  ].obs;

  final Rx<Routes> _menuModel = Routes.home.obs;

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
    Get.offAllNamed(newMenuModel.path);
  }
}
