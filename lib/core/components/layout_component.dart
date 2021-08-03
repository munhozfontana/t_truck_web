import 'package:flutter/material.dart';

import '../styles/style_colors.dart';
import 'header/header_component.dart';
import 'menu/menu_component.dart';
import 'responsive.dart';

class LayoutComponent extends StatelessWidget {
  final Widget? child;

  const LayoutComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: whenMobile(context),
      tablet: whenTablet(context),
      desktop: whenDesktop(),
    );
  }

  Widget whenDesktop() {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
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
                        Visibility(
                          visible: child != null,
                          child: Expanded(
                            flex: 800,
                            child: child!,
                          ),
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

  Widget whenTablet(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MenuComponent(),
      ),
      appBar: const HeaderComponent(
        spaceIcon: 3,
      ).build(context),
      body: Row(
        children: [
          Expanded(
            flex: 1244,
            child: Column(
              children: [
                Expanded(
                  flex: 812,
                  child: Container(
                    color: StylesColors.graySoft,
                    child: Row(
                      children: [
                        const Spacer(
                          flex: 50,
                        ),
                        Visibility(
                          visible: child != null,
                          child: Expanded(
                            flex: 800,
                            child: child!,
                          ),
                        ),
                        const Spacer(
                          flex: 50,
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

  Widget whenMobile(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MenuComponent(),
      ),
      appBar: const HeaderComponent(
        spaceIcon: 10,
      ).build(context),
      body: Row(
        children: [
          Expanded(
            flex: 1244,
            child: Column(
              children: [
                Expanded(
                  flex: 812,
                  child: Container(
                    color: StylesColors.graySoft,
                    child: Row(
                      children: [
                        const Spacer(
                          flex: 50,
                        ),
                        Visibility(
                          visible: child != null,
                          child: Expanded(
                            flex: 800,
                            child: child!,
                          ),
                        ),
                        const Spacer(
                          flex: 50,
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
