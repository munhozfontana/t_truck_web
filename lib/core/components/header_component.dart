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
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.dashboard),
                    const SizedBox(width: 15),
                    const Text('Painel')
                  ],
                ),
                const Spacer(
                  flex: 25,
                ),
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(width: 15),
                    const Text('User')
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
