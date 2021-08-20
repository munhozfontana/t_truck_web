import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/map/map_controller.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/entities/order_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_detail/domain/use_cases/protocols/i_list_truck_details_orders_case.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/delivery_status_enum.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';

class TruckDriversDetailController extends GetxController {
  final IListTruckDetailsOrdersCase iListTruckDetailsOrdersCase;

  Rx<TruckDriversEntity> truckDriversEntity = TruckDriversEntity(
          cod: '',
          status: DeliveryStatus.done,
          quantityDelivers: '',
          truckDriver: '')
      .obs;

  RxList<OrderEntity> list = <OrderEntity>[].obs;
  RxString codMot = "".obs;

  TruckDriversDetailController({
    required this.iListTruckDetailsOrdersCase,
  });

  Rx<MapPageController> mapPageController = Get.find<MapPageController>().obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters['id'] == null) {
      Get.back();
    }
    codMot.value = Get.parameters['id']!;

    print(mapPageController.value.markers);

    getInitData();
  }

  Future<void> getInitData() async {
    (await iListTruckDetailsOrdersCase(Params(id: int.parse(codMot.value))))
        .fold(
      (l) => null,
      (r) => {
        list.value = r,
      },
    );
  }
}
