import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/chat/chat_controller.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class ChatComponent extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    const edgeInsets =
        EdgeInsets.only(top: 14, left: 16, right: 16, bottom: 14);
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
              onSelect: (index) {
                controller.openTab();
              },
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
                    Divider(),
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
                    SizedBox(
                      height: 8,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 90),
                      child: TextField(
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
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('1'),
              ),
              title: Text('2'),
              subtitle: Text('3'),
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
                      margin: EdgeInsets.all(10),
                      child: Material(
                        child: InkWell(
                          onTap: () => {
                            if (onSelect != null) {onSelect(index)}
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(index.toString()),
                              backgroundColor: Colors.purple,
                            ),
                            title: Text(index.toString()),
                            subtitle: Text(index.toString()),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 2,
                    ),
                itemCount: 18),
          )
        ],
      ),
    );
  }
}
