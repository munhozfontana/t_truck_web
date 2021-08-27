import 'package:get/get.dart';
import 'package:t_truck_web/features/config/data/external/config_external.dart';
import 'package:t_truck_web/features/config/data/external/protocols/i_config_external.dart';
import 'package:t_truck_web/features/config/data/repositories_impl/config_repository.dart';
import 'package:t_truck_web/features/config/domain/repositories/i_config_repository.dart';
import 'package:t_truck_web/features/config/domain/use_cases/protocols/i_save_config_case.dart';
import 'package:t_truck_web/features/config/domain/use_cases/save_config_case.dart';
import 'package:t_truck_web/features/config/ui/config/config_controller.dart';

class ConfigBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IConfigExternal>(
      () => ConfigExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IConfigRepository>(
      () => ConfigRepository(
        iConfigExternal: Get.find(),
      ),
    );

    Get.lazyPut<ISaveConfigCase>(
      () => SaveConfigCase(
        iConfigRepository: Get.find(),
      ),
    );

    Get.put<ConfigController>(
      ConfigController(
        iSaveConfigCase: Get.find(),
      ),
    );
  }
}
