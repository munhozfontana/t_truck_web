import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/data/models/products_model.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/usecases/devolution_detail_case.dart';
import 'package:t_truck_web/features/devolution/devolution_list/data/models/devolution_model.dart';
import 'package:t_truck_web/features/devolution/devolution_list/ui/devolution_list/devolution_list_controller.dart';

class DevolutionDetailController extends GetxController {
  RxList<ProductsModel> list = <ProductsModel>[].obs;
  late Rx<DevolutionModel> devolution;

  DevolutionDetailCase devolutionDetailCase;

  DevolutionDetailController({
    required this.devolutionDetailCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    devolution = Get.find<DevolutionListController>()
        .list
        .firstWhere((element) => element.cod.toString() == Get.parameters['id'])
        .obs;

    (await devolutionDetailCase(Params(id: devolution.value.cod))).fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }
}
