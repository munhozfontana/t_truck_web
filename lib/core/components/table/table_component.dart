import 'package:flutter/material.dart';

import '../../styles/style_colors.dart';

class TableComponent extends StatelessWidget {
  final List<String> header;
  final List<List<Widget>> data;

  const TableComponent({
    Key? key,
    required this.header,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showBottomBorder: true,
      columns: header.map((e) => DataColumn(label: Text(e))).toList(),
      rows: data
          .map(
            (element) => DataRow(
              color: MaterialStateProperty.all(StylesColors.white),
              cells: element.map((e) => DataCell(e)).toList(),
            ),
          )
          .toList(),
    );
  }
}
