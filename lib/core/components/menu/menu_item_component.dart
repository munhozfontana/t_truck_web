import 'dart:math';

import 'package:flutter/material.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

import '../../animations/animations_utils.dart';
import '../../styles/style_colors.dart';
import '../../styles/styles_fonts.dart';

class MenuItemComponent extends StatefulWidget {
  final double height;
  final Routes menuModel;
  final void Function(Routes) onTap;

  const MenuItemComponent({
    Key? key,
    required this.height,
    required this.menuModel,
    required this.onTap,
  }) : super(key: key);

  @override
  _MenuItemComponentState createState() => _MenuItemComponentState();
}

class _MenuItemComponentState extends State<MenuItemComponent>
    with TickerProviderStateMixin {
  late AnimationController _hoverAnimCtl;
  late AnimationController _selectAnimCtl;
  AnimationsUtils animationsUtils = AnimationsUtils();

  @override
  void initState() {
    super.initState();
    _hoverAnimCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _selectAnimCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _hoverAnimCtl.dispose();
    _selectAnimCtl.dispose();
    super.dispose();
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
            onTap: () {
              widget.onTap(widget.menuModel);
              _selectAnimCtl
                  .forward()
                  .whenCompleteOrCancel(_selectAnimCtl.reverse);
            },
            child: AnimatedBuilder(
              animation: _hoverAnimCtl,
              builder: (context, child) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: const [0.1, 1],
                          colors: animationsUtils.animatedColorList(begin: [
                            StylesColors.blue.withOpacity(.69),
                            StylesColors.blue,
                          ], end: [
                            StylesColors.blue,
                            StylesColors.blue.withOpacity(.69),
                          ], parent: _hoverAnimCtl),
                        ),
                      ),
                      height: widget.height,
                      width: animationsUtils
                          .animateDouble(
                            parent: _hoverAnimCtl,
                            begin: 0,
                            end: constraints.maxWidth,
                          )
                          .value,
                    ),
                    SizedBox(
                      height: widget.height,
                      child: Row(
                        children: [
                          Expanded(
                            child: Transform.rotate(
                              angle: widget.menuModel.menu.iconInverted!
                                  ? 180 * pi / 180
                                  : 0,
                              child: Icon(widget.menuModel.menu.icon,
                                  color: animationsUtils
                                      .animateColor(
                                          parent: _hoverAnimCtl,
                                          begin: StylesColors.gray,
                                          end: Colors.white)
                                      .value),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: AnimatedBuilder(
                              animation: _selectAnimCtl,
                              builder: (context, child) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: animationsUtils
                                        .animateDouble(
                                          parent: _selectAnimCtl,
                                          begin: 0,
                                          end: 10,
                                        )
                                        .value,
                                  ),
                                  child: Text(
                                    widget.menuModel.menu.text,
                                    style: StylesTypography.h16.copyWith(
                                        color: animationsUtils
                                            .animateColor(
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
