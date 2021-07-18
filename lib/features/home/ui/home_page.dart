import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/body_component.dart';
import '../../../core/components/layout_component.dart';
import '../../../core/components/title_component.dart';
import '../../../core/styles/style_colors.dart';
import '../../../core/styles/styles_fonts.dart';
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
                    children: [
                      cardInfo(),
                      const Spacer(flex: 33),
                      cardInfo(),
                      const Spacer(flex: 33),
                      cardInfo(),
                      const Spacer(flex: 33),
                      cardInfo(),
                    ],
                  ),
                ),
                const Spacer(flex: 26),
                Expanded(
                  flex: 350,
                  child: controller.mapEntity.value.map,
                ),
                const Spacer(flex: 25),
                const TitleComponent(
                  flex: 36,
                  title: 'Painel',
                ),
                const Spacer(flex: 44),
                const Expanded(
                  flex: 96,
                  child: Text('test'),
                ),
                const Spacer(flex: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded cardInfo({
    String quantity = '000',
    String description = 'Sem informação',
  }) {
    return Expanded(
      flex: 176,
      child: Container(
        decoration: BoxDecoration(
          color: StylesColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Icon(Icons.access_time_rounded),
                      const Spacer(),
                      const Icon(Icons.replay)
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    quantity,
                    style: StylesTypography.h48,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    quantity,
                    style: StylesTypography.h18wBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
