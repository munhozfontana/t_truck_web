import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/layout_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/table/table_cell_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_dropdown.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';

import './message_detail_controller.dart';

class MessageDetailPage extends GetView<MessageDetailController> {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      child: Padding(
        padding: EdgeInsets.only(
            top: Responsive.when(
          context,
          mobile: 8,
          orOther: 32,
        )),
        child: Flex(
          direction: Responsive.when(
            context,
            mobile: Axis.vertical,
            orOther: Axis.horizontal,
          ),
          children: [
            info(context),
            scroll(context),
          ],
        ),
      ),
    );
  }

  Expanded scroll(BuildContext context) {
    return Expanded(
      flex: Responsive.when(
        context,
        desktop: 1,
        mobile: 4,
        orOther: 1,
      ),
      child: Obx(() {
        return ListView.separated(
          itemCount: controller.list.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(22),
              height: 250,
              decoration: BoxDecoration(
                color: controller.list[index].nameFrom == 'A'
                    ? StylesColors.grayCardChat
                    : Colors.white,
                border: Border.all(
                  color: StylesColors.grayWhite.withOpacity(.5),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.list[index].nameFrom,
                        style: StylesTypography.h16Bold,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        controller.list[index].sendAt.toIso8601String(),
                        textAlign: TextAlign.justify,
                        style: StylesTypography.h14.copyWith(
                          color: StylesColors.black.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      controller.list[index].content,
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
        );
      }),
    );
  }

  Expanded info(BuildContext context) {
    return Expanded(
      flex: Responsive.when(
        context,
        mobile: 1,
        orOther: 1,
      ),
      child: Column(
        children: [
          Expanded(
            flex: Responsive.when(
              context,
              mobile: 5,
              orOther: 1,
            ),
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: Responsive.isNotMobile(context),
                    child: Text(
                      'Chamado nº ${controller.supportEntity.value.cod}',
                      style: StylesTypography.h24,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TableCellComponent(
                          value: DeliveryStatus.done.desc,
                          color: DeliveryStatus.done.color,
                          typeCellComponent: TypeCellComponent.outline,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: Responsive.when(context, orOther: 3),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: StylesDropdown.defaultDropdown(),
                          hint: const Text('Alterar status'),
                          items:
                              DeliveryStatus.values.map((DeliveryStatus value) {
                            return DropdownMenuItem<String>(
                              value: value.index.toString(),
                              child: Text(
                                value.desc,
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
                    'Abertura: ${controller.supportEntity.value.openAt}',
                    style: StylesTypography.h16W400.copyWith(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ],
              );
            }),
          ),
          Spacer(
            flex: Responsive.when(
              context,
              mobile: 1,
              orOther: 5,
            ),
          )
        ],
      ),
    );
  }
}
