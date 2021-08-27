import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/adapters/drivers/jwt_decoder_driver.dart';
import 'package:t_truck_web/core/adapters/drivers/logged_user.dart';
import 'package:t_truck_web/core/adapters/drivers/shared_preferences_driver.dart';
import 'package:t_truck_web/core/adapters/protocols/i_jwt_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_local_store_external.dart';
import 'package:t_truck_web/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_web/core/interceptors/app_interceptor.dart';
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

import 'adapters/drivers/dio_driver.dart';
import 'adapters/protocols/i_http_external.dart';
import 'utils/app_dialog.dart';

class CoreBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAppDialog>(
      AppDialog(),
      permanent: true,
    );
    Get.lazyPut<IHttp>(
      () => DioDriver(
        interceptors:
            AppInterceptor(storeController: Get.find()).allInterceptor(),
        dio: Dio(BaseOptions(
          connectTimeout:
              const Duration(seconds: 5).inMilliseconds, // 60 seconds
          receiveTimeout:
              const Duration(seconds: 5).inMilliseconds, // 60 seconds
        )),
      ),
    );

    Get.lazyPut<ILocalStoreExternal>(
      () => SharedPreferencesDriver(),
    );

    Get.lazyPut<IJwt>(
      () => JwtDecoderDriver(),
    );

    Get.put<ILoggedUser>(
        LoggedUser(
          iJwt: Get.find(),
          iLocalStoreExternal: Get.find(),
        ),
        permanent: true);

    // REPOS

    chat();
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
          iListChatPeopleCase: Get.find(),
          iReceiveChatMessageCase: Get.find(),
          iSendChatMessageCase: Get.find(),
        ),
        permanent: true);
  }
}
