import 'package:flutter/material.dart';

import '../../styles/style_colors.dart';
import '../../styles/styles_fonts.dart';

class MenuItemComponent extends StatefulWidget {
  final double height;
  final IconData? icon;
  final String text;

  const MenuItemComponent({
    Key? key,
    required this.height,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _MenuItemComponentState createState() => _MenuItemComponentState();
}

class _MenuItemComponentState extends State<MenuItemComponent>
    with TickerProviderStateMixin {
  late AnimationController _hoverAnimCtl;
  late AnimationController _selectAnimCtl;

  @override
  void initState() {
    super.initState();
    _hoverAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _selectAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  Animation<double> animateDouble({
    required double begin,
    required double end,
    required Animation<double> parent,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.decelerate,
      ),
    );
  }

  Animation<Color?> animateColor({
    required Color begin,
    required Color end,
    required Animation<double> parent,
  }) {
    return ColorTween(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.decelerate,
      ),
    );
  }

  List<Color> animatedColorList({
    required List<Color> begin,
    required List<Color> end,
    required Animation<double> parent,
  }) {
    return begin.asMap().entries.map((entry) {
      return animateColor(
        begin: entry.value,
        end: end[entry.key],
        parent: parent,
      ).value!;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        return MouseRegion(
          onHover: (event) => _hoverAnimCtl.forward(),
          onExit: (event) => _hoverAnimCtl.reverse(),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _selectAnimCtl
                .forward()
                .whenCompleteOrCancel(_selectAnimCtl.reverse),
            child: AnimatedBuilder(
              animation: _hoverAnimCtl,
              builder: (context, child) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.1, 1],
                          colors: animatedColorList(begin: [
                            StylesColors.blue.withOpacity(.69),
                            StylesColors.blue,
                          ], end: [
                            StylesColors.blue,
                            StylesColors.blue.withOpacity(.69),
                          ], parent: _hoverAnimCtl),
                        ),
                      ),
                      height: widget.height,
                      width: animateDouble(
                        parent: _hoverAnimCtl,
                        begin: 0,
                        end: constraints.maxWidth,
                      ).value,
                    ),
                    Container(
                      height: widget.height,
                      child: Row(
                        children: [
                          Expanded(
                            child: Icon(widget.icon,
                                color: animateColor(
                                        parent: _hoverAnimCtl,
                                        begin: StylesColors.gray,
                                        end: Colors.white)
                                    .value),
                          ),
                          Expanded(
                            flex: 3,
                            child: AnimatedBuilder(
                              animation: _selectAnimCtl,
                              builder: (context, child) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: animateDouble(
                                      parent: _selectAnimCtl,
                                      begin: 0,
                                      end: 10,
                                    ).value,
                                  ),
                                  child: Text(
                                    widget.text,
                                    style: StylesTypography.h16.copyWith(
                                        color: animateColor(
                                                parent: _hoverAnimCtl,
                                                begin: StylesColors.gray,
                                                end: Colors.white)
                                            .value),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
