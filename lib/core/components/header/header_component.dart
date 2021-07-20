import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/header/header_controller.dart';

import '../../styles/style_colors.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HeaderComponentController controller =
        Get.put(HeaderComponentController());
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
                    Obx(() => Icon(controller.menuModel.icon)),
                    const SizedBox(width: 15),
                    Obx(() => Text(controller.menuModel.text))
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
