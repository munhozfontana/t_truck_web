import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/chat/ui/chat_controller.dart';

class ChatUserComponent extends GetWidget<ChatController> {
  final double? width;
  final double? height;
  final void Function(int)? onSelect;
  final void Function()? onClose;

  ChatUserComponent({
    this.width,
    this.height,
    this.onSelect,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: controller.edgeInsets,
      decoration: controller.boxDecoration,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mensagens',
                style: StylesTypography.h18wBold,
              ),
              GestureDetector(
                onTap: onClose,
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(() {
              return ListView.separated(
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  child: Material(
                    child: InkWell(
                      onTap: () => {
                        if (onSelect != null) {onSelect!(index)}
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: StylesColors.grayWhitePlus,
                          child: controller.listChatMessage[index].avatar,
                        ),
                        title: Text(
                          controller.listChatMessage[index].name,
                        ),
                        subtitle: Text(
                          controller.listChatMessage[index].codPerson,
                        ),
                        trailing: Visibility(
                          visible:
                              controller.listChatMessage[index].notifications !=
                                  0,
                          child: CircleAvatar(
                            backgroundColor: StylesColors.green,
                            child: Text(
                              "${controller.listChatMessage[index].notifications}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 2,
                ),
                itemCount: controller.listChatMessage.length,
              );
            }),
          )
        ],
      ),
    );
  }
}
