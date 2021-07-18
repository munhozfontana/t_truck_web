import 'package:flutter/material.dart';

import '../styles/style_colors.dart';
import 'header_component.dart';
import 'menu/menu_component.dart';

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
          const Expanded(
            flex: 196,
            child: MenuComponent(),
          ),
          Expanded(
            flex: 1244,
            child: Column(
              children: [
                const Expanded(
                  flex: 88,
                  child: HeaderComponent(),
                ),
                Expanded(
                  flex: 812,
                  child: Container(
                    color: StylesColors.graySoft,
                    child: Row(
                      children: [
                        const Spacer(
                          flex: 124,
                        ),
                        Expanded(
                          flex: 800,
                          child: child,
                        ),
                        const Spacer(
                          flex: 320,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
