import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';

import '../../styles/style_colors.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerMenu = Get.find<MenuComponentController>();

    return Container(
      color: StylesColors.white,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Obx(() => Icon(controllerMenu.menuModel.icon)),
                    const SizedBox(width: 15),
                    Obx(() => Text(controllerMenu.menuModel.text))
                  ],
                ),
                const Spacer(
                  flex: 25,
                ),
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(width: 15),
                    const Text('User')
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
