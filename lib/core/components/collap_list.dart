import 'package:flutter/material.dart';

import 'sliver_app_bar_delegate.dart';

class CollapList extends StatelessWidget {
  final List<Widget> slivers;

  const CollapList({
    Key? key,
    required this.slivers,
  }) : super(key: key);

  static SliverPersistentHeader makeHeader(
    Widget child, {
    double minHeight = 60.0,
    double maxHeight = 200.0,
  }) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: slivers,
    );
  }
}
