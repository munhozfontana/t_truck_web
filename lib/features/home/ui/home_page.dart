import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/layout_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Text('home'),
    );
  }
}
