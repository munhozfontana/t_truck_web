import 'package:flutter/material.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  _MenuComponentState createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  double? maxHeight;

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 88,
            child: logo(),
          ),
          Expanded(
            flex: 764,
            child: itemsMenu(),
          ),
          Expanded(
            flex: 48,
            child: linkExit(),
          ),
        ],
      ),
    );
  }

  Container linkExit() => Container();

  ListView itemsMenu() {
    double height = maxHeight! * .05398;
    return ListView(
      children: [
        item(height: height),
        item(height: height),
        item(height: height),
      ],
    );
  }

  Container item({required double height}) {
    return Container(
      height: height,
    );
  }

  Container logo() => Container();
}
