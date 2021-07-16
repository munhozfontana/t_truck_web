import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/header_component.dart';
import 'package:t_truck_web/core/components/menu/menu_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

class LayoutComponent extends StatelessWidget {
  final Widget child;

  const LayoutComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 196,
            child: MenuComponent(),
          ),
          Expanded(
            flex: 1244,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 88,
                    child: Container(
                      child: HeaderComponent(),
                    ),
                  ),
                  Expanded(
                    flex: 812,
                    child: Container(
                        color: StylesColors.graySoft,
                        child: Row(
                          children: [
                            Spacer(),
                            Expanded(
                              flex: 9,
                              child: child,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
