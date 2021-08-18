import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/usecases/list_truck_drivers_case.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class TruckDriversListController extends GetxController {
  RxList<TruckDriversEntity> list = <TruckDriversEntity>[].obs;

  final ListTruckDriversCase listTruckDriversCase;

  TruckDriversListController({
    required this.listTruckDriversCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  Future<void> getInitData() async {
    (await listTruckDriversCase(const Params())).fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }

  void toDetailPage(TruckDriversEntity e) {
    Get.toNamed('${Routes.truckDrivers.path}/${e.cod}');
  }
}
