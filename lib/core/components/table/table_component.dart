import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class TableComponent extends StatelessWidget {
  final List<String> header;
  final List<List<Widget>> data;
  final List<int>? space;
  final ScrollController? scrollController;

  const TableComponent({
    Key? key,
    this.header = const [],
    required this.data,
    this.space,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: header.isNotEmpty,
          child: headerTable(),
        ),
        bodyTable(),
      ],
    );
  }

  Expanded headerTable() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: header
            .asMap()
            .entries
            .map(
              (e) => Expanded(
                flex: buildSpaceColumn(e),
                child: Text(
                  e.value,
                  style: StylesTypography.h16.copyWith(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Expanded bodyTable() {
    return Expanded(
      flex: 10,
      child: LayoutBuilder(
        builder: (_, constrains) {
          return ListView.separated(
            controller: scrollController ?? ScrollController(),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 30 + (constrains.maxHeight * .03),
                decoration: BoxDecoration(
                    color: StylesColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: data[index]
                      .asMap()
                      .entries
                      .map(
                        (child) => Expanded(
                          flex: buildSpaceColumn(child),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [child.value],
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            },
          );
        },
      ),
    );
  }

  int buildSpaceColumn(MapEntry<int, dynamic> e) {
    if (space != null && space!.length > e.key) {
      return space![e.key];
    }

    return 1;
  }
}
