import 'package:flutter/material.dart';

import '../../../../core/animations/animations_utils.dart';
import '../../../../core/components/responsive.dart';
import '../../../../core/styles/style_colors.dart';
import '../../../../core/styles/styles_fonts.dart';

class QuickAccessComponent extends StatefulWidget {
  final BoxConstraints constraints;
  final IconData? icon;
  final String? label;
  final void Function()? onTap;

  const QuickAccessComponent({
    Key? key,
    required this.constraints,
    this.icon = Icons.flutter_dash_outlined,
    this.label = 'Sem informação',
    this.onTap,
  }) : super(key: key);

  @override
  _QuickAccessComponentState createState() => _QuickAccessComponentState();
}

class _QuickAccessComponentState extends State<QuickAccessComponent>
    with TickerProviderStateMixin {
  late AnimationController _initAnimCtl;
  late AnimationController _selectAnimCtl;

  final _utils = AnimationsUtils();

  @override
  void initState() {
    super.initState();

    _initAnimCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _initAnimCtl.forward();

    _selectAnimCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _selectAnimCtl.dispose();
    _initAnimCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _selectAnimCtl,
      builder: (context, child) {
        return AnimatedBuilder(
          animation: _initAnimCtl,
          builder: (_, __) {
            final widthItem = widget.constraints.maxWidth *
                (Responsive.isNotMobile(context) ? .2192 : .333);
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onEventTap(),
                child: Opacity(
                  opacity: _utils
                      .animateDouble(begin: 0, end: 1, parent: _initAnimCtl)
                      .value,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: _utils
                            .animateDouble(
                                begin: 0, end: 5, parent: _selectAnimCtl)
                            .value,
                        vertical: _utils
                            .animateDouble(
                                begin: 0, end: 3, parent: _selectAnimCtl)
                            .value),
                    width: widthItem,
                    decoration: BoxDecoration(
                      color: StylesColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Visibility(
                      visible: Responsive.isNotMobile(context),
                      replacement: Icon(widget.icon),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Icon(widget.icon),
                            ),
                            Visibility(
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.label!,
                                      style: StylesTypography.h16,
                                    ),
                                    const Icon(Icons.arrow_right_alt_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void onEventTap() {
    if (widget.onTap != null) {
      {
        _selectAnimCtl.forward().whenCompleteOrCancel(() => {
              widget.onTap!(),
              _selectAnimCtl.reverse(),
            });
      }
    }
  }
}
