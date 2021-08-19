import 'package:get/get.dart';

import 'data/external/devolution_external.dart';
import 'data/external/protocols/i_devolution_external.dart';
import 'data/repositories_impl/devolution_repository.dart';
import 'domain/repositories/i_devolution_repository.dart';
import 'domain/usecases/list_devolution_case.dart';
import 'ui/devolution_list/devolution_list_controller.dart';

class DevolutionListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDevolutionExternal>(
      () => DevolutionExternal(
        iHttp: Get.find(),
      ),
    );

    Get.lazyPut<IDevolutionRepository>(
      () => DevolutionRepository(
        iDevolutionExternal: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ListDevolutionCase(
        iDevolutionRepository: Get.find(),
      ),
    );

    Get.put<DevolutionListController>(
      DevolutionListController(
        listDevolutionCase: Get.find(),
      ),
    );
  }
}
