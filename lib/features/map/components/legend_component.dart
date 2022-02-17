import 'package:flutter/material.dart';
import 'package:t_truck_web/core/animations/animations_utils.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/map/entites/lenged_map.dart';

class LegendComponent extends StatefulWidget {
  final List<LengedMap> lengedMap;

  const LegendComponent({Key? key, required this.lengedMap}) : super(key: key);

  @override
  _LegendComponentState createState() => _LegendComponentState();
}

class _LegendComponentState extends State<LegendComponent>
    with SingleTickerProviderStateMixin {
  late AnimationsUtils animationsUtils;
  late AnimationController _openAnimCtl;

  @override
  void initState() {
    animationsUtils = AnimationsUtils();
    _openAnimCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    _openAnimCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return GestureDetector(
          onTap: () {
            if (_openAnimCtl.isDismissed) {
              _openAnimCtl.forward();
            } else {
              _openAnimCtl.reverse();
            }
          },
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedBuilder(
              animation: _openAnimCtl,
              builder: (context, child) {
                const maxHeightContainer = 90.0;
                final maxWidhtContainer =
                    widget.lengedMap.length * (constrains.maxWidth * .05);
                final legendSizeAnimted = animationsUtils
                    .animateDouble(
                      parent: _openAnimCtl,
                      begin: 0,
                      end: maxHeightContainer / 3,
                    )
                    .value;
                final verticalOffsetTolltip = -legendSizeAnimted - 10;
                return Container(
                  margin: EdgeInsets.all(constrains.maxHeight / 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: StylesColors.white.withAlpha(
                      animationsUtils
                          .animateDouble(
                            parent: _openAnimCtl,
                            begin: 255,
                            end: 120,
                          )
                          .value
                          .toInt(),
                    ),
                  ),
                  height: animationsUtils
                      .animateDouble(
                        parent: _openAnimCtl,
                        begin: 50,
                        end: maxHeightContainer,
                      )
                      .value,
                  width: animationsUtils
                      .animateDouble(
                        parent: _openAnimCtl,
                        begin: 50,
                        end: maxWidhtContainer,
                      )
                      .value,
                  child: Visibility(
                    visible:
                        _openAnimCtl.isAnimating || _openAnimCtl.isCompleted,
                    replacement: const Icon(
                      Icons.help_outline_outlined,
                      size: 30,
                    ),
                    child: IgnorePointer(
                      ignoring: _openAnimCtl.isAnimating,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.lengedMap
                            .map(
                              (e) => Tooltip(
                                verticalOffset: verticalOffsetTolltip - 5,
                                textStyle: StylesTypography.h16.copyWith(
                                  color: Colors.white,
                                ),
                                message: e.description,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: e.color,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(legendSizeAnimted),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.15),
                                        spreadRadius: 2,
                                        blurRadius: 9,
                                        offset: const Offset(
                                          0,
                                          4,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: legendSizeAnimted,
                                  height: legendSizeAnimted,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
