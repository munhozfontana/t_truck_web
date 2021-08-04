import 'package:flutter/material.dart';

import '../../styles/styles_fonts.dart';

enum TypeCellComponent { normal, outline }

class TableCellComponent extends StatelessWidget {
  final String value;
  final Color color;
  final double? width;
  final TypeCellComponent typeCellComponent;

  const TableCellComponent({
    Key? key,
    required this.value,
    required this.color,
    this.typeCellComponent = TypeCellComponent.normal,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOutLine = typeCellComponent == TypeCellComponent.outline;

    final boxDecoration = BoxDecoration(
        color: isOutLine ? Colors.transparent : color,
        borderRadius: BorderRadius.circular(20),
        border: isOutLine
            ? Border.all(color: color.withOpacity(.2), width: 2)
            : Border.all(width: 0, color: Colors.transparent));

    final text = Text(
      value,
      style: isOutLine
          ? StylesTypography.h16Bold.copyWith(color: color)
          : StylesTypography.h16Bold,
    );

    return Visibility(
      visible: width != null,
      replacement: Container(
        alignment: Alignment.center,
        height: 30,
        decoration: boxDecoration,
        child: text,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: width,
        decoration: boxDecoration,
        child: text,
      ),
    );
  }
}
