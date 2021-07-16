import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StylesColors.white,
      child: Column(
        children: [
          Spacer(),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.dashboard),
                        SizedBox(width: 15),
                        Text('Painel')
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 25,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 15),
                        Text('User')
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
