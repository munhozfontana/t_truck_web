import 'package:get/get.dart';
import 'package:t_truck_web/core/utils/app_dialog.dart';

import '../../core/adapters/map/i_map_adp.dart';
import 'data/external/map_box_driver.dart';
import 'data/repository_impl/map_repository.dart';
import 'domain/repositories/i_map_repository.dart';
import 'domain/use_cases/map_use_case.dart';
import 'ui/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<IMapAdp>(
      MapBox(),
      permanent: true,
    );

    Get.put<IMapRepository>(
      MapRepository(
        iMap: Get.find(),
      ),
      permanent: true,
    );

    Get.put<MapUseCase>(
      MapUseCase(
        iMapRepository: Get.find(),
      ),
      permanent: true,
    );

    Get.put<AppDialog>(
      AppDialog(),
      permanent: true,
    );

    Get.put<HomeController>(
        HomeController(
          mapUseCase: Get.find(),
          appDialog: Get.find(),
        ),
        permanent: true);
  }
}
