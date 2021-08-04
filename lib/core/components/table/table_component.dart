import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

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
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: header
                .map((e) => Expanded(
                      child: Text(
                        e,
                        style: StylesTypography.h16.copyWith(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          flex: 10,
          child: LayoutBuilder(
            builder: (_, constrains) {
              return ListView.separated(
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
                          .map(
                            (child) => Expanded(
                              flex: index == 0 ? 20 : 1,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [child],
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
        )
      ],
    );
  }
}
