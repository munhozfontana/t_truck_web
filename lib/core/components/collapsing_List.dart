import 'dart:math' as math;

import 'package:flutter/material.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  final List<Widget> slivers;

  const CollapsingList({
    Key? key,
    required this.slivers,
  }) : super(key: key);

  static SliverPersistentHeader makeHeader(Widget child,
      {double minHeight = 60.0, double maxHeight = 200.0}) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
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
      // slivers: <Widget>[
      //   makeHeader('Header Section 1'),
      //   SliverGrid.count(
      //     crossAxisCount: 3,
      //     children: [
      //       Container(color: Colors.red, height: 150.0),
      //       Container(color: Colors.purple, height: 150.0),
      //       Container(color: Colors.green, height: 150.0),
      //       Container(color: Colors.orange, height: 150.0),
      //       Container(color: Colors.yellow, height: 150.0),
      //       Container(color: Colors.pink, height: 150.0),
      //       Container(color: Colors.cyan, height: 150.0),
      //       Container(color: Colors.indigo, height: 150.0),
      //       Container(color: Colors.blue, height: 150.0),
      //     ],
      //   ),
      //   makeHeader('Header Section 2'),
      //   SliverFixedExtentList(
      //     itemExtent: 150.0,
      //     delegate: SliverChildListDelegate(
      //       [
      //         Container(color: Colors.red),
      //         Container(color: Colors.purple),
      //         Container(color: Colors.green),
      //         Container(color: Colors.orange),
      //         Container(color: Colors.yellow),
      //       ],
      //     ),
      //   ),
      //   makeHeader('Header Section 3'),
      //   SliverGrid(
      //     gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
      //       maxCrossAxisExtent: 200.0,
      //       mainAxisSpacing: 10.0,
      //       crossAxisSpacing: 10.0,
      //       childAspectRatio: 4.0,
      //     ),
      //     delegate: new SliverChildBuilderDelegate(
      //       (BuildContext context, int index) {
      //         return new Container(
      //           alignment: Alignment.center,
      //           color: Colors.teal[100 * (index % 9)],
      //           child: new Text('grid item $index'),
      //         );
      //       },
      //       childCount: 20,
      //     ),
      //   ),
      //   makeHeader('Header Section 4'),
      //   SliverList(
      //     delegate: SliverChildListDelegate(
      //       [
      //         Container(color: Colors.pink, height: 150.0),
      //         Container(color: Colors.cyan, height: 150.0),
      //         Container(color: Colors.indigo, height: 150.0),
      //         Container(color: Colors.blue, height: 150.0),
      //       ],
      //     ),
      //   ),
      // ],
    );
  }
}
