import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_dropdown.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/enum/delivery_status_enum.dart';

import './message_detail_controller.dart';

class MessageDetailPage extends GetView<MessageDetailController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chamado nº 632',
                        style: StylesTypography.h24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TableCellComponent(
                              value: DeliveryStatus.done.desc,
                              color: DeliveryStatus.done.color,
                              typeCellComponent: TypeCellComponent.outline,
                              width: 180,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 3,
                            child: DropdownButtonFormField<String>(
                              decoration: StylesDropdown.defaultDropdown(),
                              hint: const Text('Alterar status'),
                              items: <String>['A', 'B', 'C', 'D']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    'Alterar status',
                                    style: StylesTypography.h16W400,
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                      Text(
                        'Abertura: 18/05/2021 - 10:45',
                        style: StylesTypography.h16W400.copyWith(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(22),
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: StylesColors.grayWhite.withOpacity(.5),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'José Oliveira',
                            style: StylesTypography.h16Bold,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '18/05/2021 - 10:45',
                            textAlign: TextAlign.justify,
                            style: StylesTypography.h14.copyWith(
                              color: StylesColors.black.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat quis semper potenti mi mauris semper. Mauris semper mauris faucibus volutpat, porta. Diam purus purus mi molestie.',
                          style: StylesTypography.h14.copyWith(
                            height: 4,
                            color: StylesColors.black.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                  height: 20,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
