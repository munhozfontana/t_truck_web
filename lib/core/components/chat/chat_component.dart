import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/chat/chat_controller.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class ChatComponent extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(
      top: 14,
      left: 16,
      right: 16,
      bottom: 14,
    );
    const boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(22),
        topRight: Radius.circular(22),
      ),
    );

    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.decelerate,
        width: 300,
        height: controller.chat.value ? controller.maxHeight.value : 0,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            chat(
              onSelect: controller.onSelect,
              onClose: () {
                controller.closeTab();
                controller.closeChat();
              },
              padding: edgeInsets,
              decoration: boxDecoration,
              width: 300,
              height: controller.minHeight.value,
            ),
            InkWell(
              onTap: () => controller.closeTab(),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.decelerate,
                width: 300,
                height: controller.visibleChatTalkComponent.value
                    ? controller.maxHeight.value * 1.2
                    : 0,
                padding: edgeInsets,
                decoration: boxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    header(),
                    const Divider(),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: StylesColors.gray,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        Faker().lorem.sentence(),
                                        style: StylesTypography.h14
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const Spacer()
                                ],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 24,
                              ),
                          itemCount: 8),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 90),
                      child: const TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.send),
                            hintText: 'Digitar mensagem'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Row header() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: StylesColors.grayWhite.withOpacity(.3),
                width: 2,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: controller.selectChat.value.avatar,
              ),
              title: Text(controller.selectChat.value.title),
              subtitle: Text(controller.selectChat.value.subtitle),
            ),
          ),
        ),
        Expanded(child: Icon(Icons.arrow_back))
      ],
    );
  }

  Widget chat({
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    Decoration? decoration,
    final void Function(int)? onSelect,
    final void Function()? onClose,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: decoration,
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
                child: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Card(
                elevation: 6,
                margin: const EdgeInsets.all(10),
                child: Material(
                  child: InkWell(
                    onTap: () => {
                      if (onSelect != null) {onSelect(index)}
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: controller.listChatMessage[index].avatar,
                      ),
                      title: Text(
                        controller.listChatMessage[index].title,
                      ),
                      subtitle: Text(
                        controller.listChatMessage[index].subtitle,
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 2,
              ),
              itemCount: controller.listChatMessage.length,
            ),
          )
        ],
      ),
    );
  }
}
