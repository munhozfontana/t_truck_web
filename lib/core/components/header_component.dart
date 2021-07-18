import 'package:flutter/material.dart';

import '../styles/style_colors.dart';

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
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      const Icon(Icons.dashboard),
                      SizedBox(width: 15),
                      const Text('Painel')
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
                      const Text('User')
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
