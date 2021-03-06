import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/models/devolution_model.dart';
import 'package:t_truck_web/features/devolution/devolution_list/devolution_list_bindings.dart';
import 'package:t_truck_web/features/devolution/devolution_list/domain/usecases/list_devolution_case.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class DevolutionListController extends GetxController {
  RxList<DevolutionModel> list = <DevolutionModel>[].obs;

  final ListDevolutionCase listDevolutionCase;

  DevolutionListController({
    required this.listDevolutionCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    (await listDevolutionCase(const Params())).fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }

  void toDetailPage(DevolutionModel e) {
    DevolutionListBindings().dependencies();
    Get.toNamed('${Routes.devolutions.path}/${e.cod}');
  }
}
