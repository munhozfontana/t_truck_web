import 'package:flutter/material.dart';

class TableCardItem {
  Widget iconTrailing;
  String? subtitle;
  String title;
  String tooltip;
  Widget? leading;

  TableCardItem({
    required this.iconTrailing,
    this.subtitle,
    required this.title,
    this.leading,
    required this.tooltip,
  });
}

class TableCardComponent extends StatelessWidget {
  final List<TableCardItem> listTableCardItem;
  final void Function(int)? onTap;

  const TableCardComponent({
    Key? key,
    required this.listTableCardItem,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.separated(
            itemCount: listTableCardItem.length,
            itemBuilder: (context, index) {
              final item = listTableCardItem[index];
              return Tooltip(
                margin: EdgeInsets.only(right: constrains.maxWidth * .9),
                message: item.tooltip,
                child: Card(
                  child: ListTile(
                    onTap: () => onTap != null ? onTap!(index) : null,
                    leading: item.leading,
                    title: Text(item.title),
                    subtitle: Text(item.subtitle ?? ""),
                    trailing: item.iconTrailing,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        );
      },
    );
  }
}
