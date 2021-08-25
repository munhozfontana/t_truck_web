import 'package:flutter/material.dart';

class ChatTalkComponent extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final Decoration decoration;
  final double height;
  final double width;
  final bool? visible;

  const ChatTalkComponent({
    Key? key,
    required this.padding,
    required this.decoration,
    required this.height,
    required this.width,
    this.visible = false,
  }) : super(key: key);

  @override
  _ChatTalkComponentState createState() => _ChatTalkComponentState();
}

class _ChatTalkComponentState extends State<ChatTalkComponent> {
  double? animatedHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(ChatTalkComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible == true) {
      openTab();
    } else {
      closeTab();
    }
  }

  void closeTab() {
    setState(() {
      animatedHeight = 0;
    });
  }

  void openTab() {
    setState(() {
      animatedHeight = widget.height * 1.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => closeTab(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.decelerate,
        width: widget.width,
        height: animatedHeight,
        padding: widget.padding,
        decoration: widget.decoration,
      ),
    );
  }
}
