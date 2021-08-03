import 'package:flutter/material.dart';

class BodyComponent extends StatelessWidget {
  final Widget? child;

  const BodyComponent({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 13,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: child ?? Container(),
          );
        },
      ),
    );
  }
}
