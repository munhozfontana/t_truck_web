import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      Icon(Icons.ac_unit),
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
                      Text('Painel')
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
    );
  }
}
