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
      child: child ?? Container(),
    );
  }
}
