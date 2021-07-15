import 'package:flutter/material.dart';
import 'package:t_truck_web/core/components/header_component.dart';
import 'package:t_truck_web/core/components/menu_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
// imprime o tamanho da altura da tela

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
                    child: Container(),
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
