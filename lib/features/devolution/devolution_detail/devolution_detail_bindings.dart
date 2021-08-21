import 'package:get/get.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/external/devolution_detail_external.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/external/protocols/i_devolution_detail_external.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/repositories/devolution_detail_repository.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/repositories/i_devolution_detail_repository.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/usecases/devolution_detail_case.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/ui/devolution_detail/devolution_detail_controller.dart';
import 'package:t_truck_web/features/devolution/devolution_list/devolution_list_bindings.dart';

class DevolutionDetailBindings implements Bindings {
  @override
  void dependencies() {
    DevolutionListBindings().dependencies();

    Get.lazyPut<IDevolutionDetailExternal>(
      () => DevolutionDetailExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IDevolutionDetailRepository>(
      () => DevolutionDetailRepository(
        iDevolutionDetailExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => DevolutionDetailCase(
        iDevolutionDetailRepository: Get.find(),
      ),
    );

    Get.lazyPut<DevolutionDetailController>(
      () => DevolutionDetailController(
        devolutionDetailCase: Get.find(),
      ),
    );
  }
}
