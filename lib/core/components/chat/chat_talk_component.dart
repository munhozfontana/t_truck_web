import 'package:flutter/material.dart';
import 'package:t_truck_web/core/animations/animations_utils.dart';

class ChatTalkComponent extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final Decoration decoration;
  final double height;
  final double width;

  const ChatTalkComponent({
    Key? key,
    required this.padding,
    required this.decoration,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _ChatTalkComponentState createState() => _ChatTalkComponentState();
}

class _ChatTalkComponentState extends State<ChatTalkComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController hoverAnimCtl;

  AnimationsUtils animationsUtils = AnimationsUtils();

  @override
  void initState() {
    hoverAnimCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    hoverAnimCtl.forward().whenComplete(() => hoverAnimCtl.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: hoverAnimCtl,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: animationsUtils
              .animateDouble(
                parent: hoverAnimCtl,
                begin: 0,
                end: widget.height,
              )
              .value,
          padding: widget.padding,
          decoration: widget.decoration,
        );
      },
    );
  }
}
