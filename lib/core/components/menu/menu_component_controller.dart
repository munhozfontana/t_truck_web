import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_model.dart';

class MenuComponentController extends GetxController {
  final _menuModel = MenuModel(
          text: 'Painel', route: '/painel', icon: Icons.view_in_ar_outlined)
      .obs;

  set menuModel(MenuModel newMenuModel) {
    _menuModel.value = newMenuModel;
  }

  MenuModel get menuModel => _menuModel.value;
}
