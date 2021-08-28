import 'package:get/get.dart';
import 'package:t_truck_web/core/components/menu/menu_component_controller.dart';
import 'package:t_truck_web/features/chat/data/external/chat_message_external.dart';
import 'package:t_truck_web/features/chat/data/external/chat_people_external.dart';
import 'package:t_truck_web/features/chat/data/external/protocols/i_chat_message_external.dart';
import 'package:t_truck_web/features/chat/data/external/protocols/i_chat_people_external.dart';
import 'package:t_truck_web/features/chat/data/repositories_impl/chat_message_repository.dart';
import 'package:t_truck_web/features/chat/data/repositories_impl/chat_people_repository.dart';
import 'package:t_truck_web/features/chat/domain/repositories/i_chat_message_repository.dart';
import 'package:t_truck_web/features/chat/domain/repositories/i_chat_people_repository.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/list_chat_people_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/protocols/i_list_chat_people_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/protocols/i_receive_chat_message_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/protocols/i_send_chat_message_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/receive_chat_message_case.dart';
import 'package:t_truck_web/features/chat/domain/use_cases/send_chat_message_case.dart';
import 'package:t_truck_web/features/chat/ui/chat_controller.dart';
import 'package:t_truck_web/features/home/data/external/dashboard_external.dart';
import 'package:t_truck_web/features/home/data/external/location_external.dart';
import 'package:t_truck_web/features/home/data/external/protocols/i_location_external.dart';
import 'package:t_truck_web/features/home/data/repositories_impl/location_repository.dart';
import 'package:t_truck_web/features/home/domain/repositories/i_location_repository.dart';
import 'package:t_truck_web/features/home/domain/use_cases/list_location_case.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_dashboard_case.dart';
import 'package:t_truck_web/features/home/domain/use_cases/protocols/i_list_location_case.dart';
import 'package:t_truck_web/features/map/map_bindings.dart';

import 'data/external/protocols/i_dashboard_external.dart';
import 'data/repositories_impl/dashboard_repository.dart';
import 'domain/repositories/i_dashboard_repository.dart';
import 'domain/use_cases/list_dashboard_case.dart';
import 'ui/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    chat();
    dashboard();
    location();

    Get.put<MenuComponentController>(
      MenuComponentController(iLoggedUser: Get.find()),
      permanent: true,
    );

    MapPageBindings().dependencies();
    Get.lazyPut<HomeController>(
      () => HomeController(
        appDialog: Get.find(),
        menuComponentController: Get.find(),
        iListDashboardCase: Get.find(),
        iListLocationCase: Get.find(),
      ),
    );
  }

  void dashboard() {
    Get.lazyPut<IDashboardExternal>(
      () => DashboardExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IDasboadRepository>(
      () => DasboadRepository(
        iDashboardExternal: Get.find(),
      ),
    );

    Get.lazyPut<IListDashboardCase>(
      () => ListDashboardCase(
        iDasboadRepository: Get.find(),
      ),
    );
  }

  void location() {
    Get.lazyPut<ILocationExternal>(
      () => LocationExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<ILocationRepository>(
      () => LocationRepository(
        iLocationExternal: Get.find(),
      ),
    );

    Get.lazyPut<IListLocationCase>(
      () => ListLocationCase(
        iLocationRepository: Get.find(),
      ),
    );
  }

  void chat() {
    Get.lazyPut<IChatMessageExternal>(
      () => ChatMessageExternal(),
    );

    Get.lazyPut<IChatPeopleExternal>(
      () => ChatPeopleExternal(iHttp: Get.find()),
    );

    Get.lazyPut<IChatMessageRepository>(
      () => ChatMessageRepository(
        iChatMessageExternal: Get.find(),
      ),
    );

    Get.lazyPut<IChatPeopleRepository>(
      () => ChatPeopleRepository(
        iChatPeopleExternal: Get.find(),
      ),
    );

    Get.lazyPut<IListChatPeopleCase>(
      () => ListChatPeopleCase(
        iChatPeopleRepository: Get.find(),
      ),
    );

    Get.lazyPut<IReceiveChatMessageCase>(
      () => ReceiveChatMessageCase(
        iChatMessageRepository: Get.find(),
      ),
    );

    Get.lazyPut<ISendChatMessageCase>(
      () => SendChatMessageCase(
        iChatMessageRepository: Get.find(),
      ),
    );

    Get.put(
        ChatController(
          iLoggedUser: Get.find(),
          iListChatPeopleCase: Get.find(),
          iReceiveChatMessageCase: Get.find(),
          iSendChatMessageCase: Get.find(),
        ),
        permanent: true);
  }
}
