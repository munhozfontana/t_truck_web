import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Column(
        children: [
          TitleComponent(title: 'Painel'),
          BodyComponent(
            child: Column(
              children: [
                Expanded(
                  flex: 177,
                  child: Row(
                    children: [
                      cardInfo(),
                      Spacer(flex: 33),
                      cardInfo(),
                      Spacer(flex: 33),
                      cardInfo(),
                      Spacer(flex: 33),
                      cardInfo(),
                    ],
                  ),
                ),
                Spacer(flex: 26),
                Expanded(
                  flex: 280,
                  child: Container(),
                ),
                Spacer(flex: 25),
                TitleComponent(
                  flex: 36,
                  title: 'Painel',
                ),
                Spacer(flex: 44),
                Expanded(
                  flex: 96,
                  child: Text('test'),
                ),
                Spacer(flex: 48),
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
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.access_time_rounded),
                        Spacer(),
                        Icon(Icons.replay)
                      ],
                    ),
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
