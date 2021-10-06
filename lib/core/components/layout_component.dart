import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_truck_web/core/components/header/header_component_sliver.dart';
import 'package:t_truck_web/core/store_controller.dart';
import 'package:t_truck_web/features/chat/ui/chat_component.dart';
import 'package:t_truck_web/features/chat/ui/chat_controller.dart';

import '../styles/style_colors.dart';
import 'header/header_component.dart';
import 'menu/menu_component.dart';
import 'responsive.dart';

class LayoutComponent extends StatelessWidget {
  final Widget? child;
  final bool fullScreen;

  const LayoutComponent({
    Key? key,
    required this.child,
    this.fullScreen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final floatActionButton = buildFloatingActionButton();
    final body = buildBody(context);
    final drawer = buildDrawer();

    return Row(
      children: [
        Visibility(
          visible: Responsive.when(context, mobile: false, orOther: true),
          child: Expanded(
            child: Material(
              child: MenuComponent(),
            ),
          ),
        ),
        Expanded(
          flex: Responsive.when(context, tablet: 12, orOther: 6),
          child: Responsive.when(
            context,
            mobile: Scaffold(
              floatingActionButton: floatActionButton,
              drawer: drawer,
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    HeaderComponentSliver(
                      spaceIcon: Responsive.when(
                        context,
                        mobile: 8,
                        orOther: 1,
                      ),
                    ),
                  ];
                },
                body: body,
              ),
            ),
            orOther: Scaffold(
              floatingActionButton: floatActionButton,
              appBar: buildHeaderComponent(context).build(context),
              body: Stack(
                children: [
                  body,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ChatComponent(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  HeaderComponent buildHeaderComponent(BuildContext context) {
    return HeaderComponent(
      spaceIcon: Responsive.when<int>(
        context,
        mobile: 15,
        tablet: 3,
        orOther: 1,
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: MenuComponent(),
    );
  }

  Widget buildBody(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: Responsive.when(
            context,
            mobile: 1244,
            tablet: 3,
            desktop: 1244,
            orOther: 1,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 812,
                child: Container(
                  color: StylesColors.graySoft,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 50,
                      ),
                      Visibility(
                        visible: child != null,
                        child: Expanded(
                          flex: 800,
                          child: Obx(() {
                            return Visibility(
                              visible:
                                  !Get.find<StoreController>().loading.value,
                              replacement: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: child!,
                              ),
                              child: child!,
                            );
                          }),
                        ),
                      ),
                      Spacer(
                        flex: Responsive.when(
                          context,
                          desktop: 150,
                          orOther: 50,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !fullScreen,
                child: const Spacer(
                  flex: 50,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFloatingActionButton() {
    final chatController = Get.find<ChatController>();

    return Obx(() {
      return Visibility(
        visible: Get.find<StoreController>().loading.isFalse &&
            chatController.chat.isFalse,
        child: FloatingActionButton(
          onPressed: () {
            return chatController.openChat();
          },
          child: Icon(
            Icons.chat_bubble,
            color: chatController.anyNotification.isTrue
                ? Colors.red
                : Colors.white,
          ),
        ),
      );
    });
  }
}
