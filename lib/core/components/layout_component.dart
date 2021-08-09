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
    final floatActionButton = buildFloatingActionButton();
    final body = buildBody(context);
    final drawer = buildDrawer();
    final appBar = buildHeaderComponent(context).build(context);

    return Responsive(
      mobile: Scaffold(
        floatingActionButton: floatActionButton,
        appBar: appBar,
        drawer: drawer,
        body: body,
      ),
      tablet: Scaffold(
        floatingActionButton: floatActionButton,
        appBar: appBar,
        drawer: drawer,
        body: body,
      ),
      desktop: Scaffold(
        floatingActionButton: floatActionButton,
        body: body,
      ),
    );
  }

  HeaderComponent buildHeaderComponent(BuildContext context) {
    return HeaderComponent(
      spaceIcon: Responsive.when<int>(
        context,
        mobile: 15,
        tablet: 3,
        orOther: 1,
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: MenuComponent(),
    );
  }

  Row buildBody(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: Responsive.isDesktop(context),
          child: Expanded(
            flex: 196,
            child: MenuComponent(),
          ),
        ),
        Expanded(
          flex: Responsive.when(
            context,
            mobile: 1244,
            tablet: 3,
            desktop: 1244,
            orOther: 1,
          ),
          child: Column(
            children: [
              Visibility(
                visible: Responsive.isDesktop(context),
                child: const Expanded(
                  flex: 88,
                  child: HeaderComponent(),
                ),
              ),
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
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    final floatActionButton = FloatingActionButton(
      onPressed: () => print('Chat'),
      child: Icon(Icons.chat_bubble),
    );
    return floatActionButton;
  }
}
