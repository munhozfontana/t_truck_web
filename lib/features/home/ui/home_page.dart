import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/icons/menu_icons_icons.dart';
import 'package:t_truck_web/features/home/ui/components/card_info_component.dart';
import 'package:t_truck_web/features/home/ui/components/quick_access_component.dart';

import '../../../core/components/body_component.dart';
import '../../../core/components/layout_component.dart';
import '../../../core/components/title_component.dart';
import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        children: [
          const TitleComponent(title: 'Painel'),
          BodyComponent(
            child: Column(
              children: [
                Expanded(
                  flex: 177,
                  child: Row(
                    children: const [
                      CardInfo(
                        icon: Icons.done,
                        colorIcon: Color(0xFF45D36D),
                      ),
                      Spacer(flex: 33),
                      CardInfo(
                        icon: Icons.info_outline,
                        colorIcon: Color(0xFFF4CE49),
                      ),
                      Spacer(flex: 33),
                      CardInfo(
                        icon: Icons.view_in_ar_outlined,
                        colorIcon: Colors.black,
                      ),
                      Spacer(flex: 33),
                      CardInfo(
                        icon: MenuIcons.subdirectory_arrow_right,
                        colorIcon: Color(0xFF2050FA),
                        inverted: true,
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 26),
                Expanded(
                  flex: 280,
                  child: controller.mapEntity.value.map,
                ),
                const Spacer(flex: 25),
                const TitleComponent(
                  flex: 36,
                  title: 'Acesso rápido',
                ),
                const Spacer(flex: 44),
                Expanded(
                  flex: 96,
                  child: LayoutBuilder(
                    builder: (_, BoxConstraints constraints) {
                      return Obx(
                        () => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => SizedBox(
                            width: constraints.maxWidth * .041066,
                          ),
                          itemCount: controller.quickAcces.length,
                          itemBuilder: (context, index) => QuickAccessComponent(
                            constraints: constraints,
                            icon: controller.quickAcces[index].icon,
                            label: controller.quickAcces[index].text,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(flex: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
