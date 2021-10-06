import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/store_controller.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import '../../styles/style_colors.dart';
import '../../styles/styles_fonts.dart';

class HeaderComponentSliver extends StatelessWidget {
  final int? spaceIcon;

  const HeaderComponentSliver({
    Key? key,
    this.spaceIcon = 1,
  }) : super(key: key);

  @override
  SliverAppBar build(BuildContext context) {
    final controllerMenu = Get.find<MenuComponentController>();

    return SliverAppBar(
      automaticallyImplyLeading: Responsive.when(
        context,
        desktop: false,
        orOther: true,
      ),
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
            Obx(
              () => Icon(
                controllerMenu.menuModel.menu.icon,
                color: StylesColors.black,
              ),
            ),
            const SizedBox(width: 15),
            Visibility(
              visible: Responsive.isNotMobile(context),
              child: Obx(
                () => Text(
                  controllerMenu.menuModel.menu.text,
                  style: StylesTypography.h18.copyWith(color: Colors.black),
                ),
              ),
            )
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
            Obx(
              () => Text(
                Get.find<StoreController>().nameUser.value,
                style: StylesTypography.h18.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
