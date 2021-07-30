import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class HeaderComponent extends StatelessWidget {
  final int? spaceIcon;

  const HeaderComponent({
    Key? key,
    this.spaceIcon = 1,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    final controllerMenu = Get.find<MenuComponentController>();

    return AppBar(
      backgroundColor: StylesColors.white,
      toolbarHeight: 80,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: StylesColors.black,
      ),
      actions: [
        Spacer(
          flex: spaceIcon!,
        ),
        Row(
          children: [
            Obx(() => Icon(
                  controllerMenu.menuModel.icon,
                  color: StylesColors.black,
                )),
            const SizedBox(width: 15),
            Obx(() => Text(
                  controllerMenu.menuModel.text,
                  style: StylesTypography.h18.copyWith(color: Colors.black),
                ))
          ],
        ),
        const Spacer(
          flex: 25,
        ),
        Row(
          children: [
            Icon(
              Icons.person_outline,
              color: StylesColors.black,
            ),
            const SizedBox(width: 15),
            Text(
              'User',
              style: StylesTypography.h18.copyWith(color: Colors.black),
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
