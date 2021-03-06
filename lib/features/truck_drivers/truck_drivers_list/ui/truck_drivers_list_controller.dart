import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/params/params.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/entities/truck_drivers_entity.dart';
import 'package:t_truck_web/features/truck_drivers/truck_drivers_list/domain/usecases/list_truck_drivers_case.dart';
import 'package:t_truck_web/routes/app_routes_enum.dart';

class TruckDriversListController extends GetxController {
  List<TruckDriversEntity> _list = <TruckDriversEntity>[];
  RxList<TruckDriversEntity> listFiltred = <TruckDriversEntity>[].obs;
  TextEditingController fieldController = TextEditingController();

  final ListTruckDriversCase listTruckDriversCase;

  TruckDriversListController({
    required this.listTruckDriversCase,
  });

  @override
  void onInit() {
    super.onInit();
    getInitData();
    fieldController.addListener(() {
      listFiltred.value = _list.where((element) {
        final text = fieldController.value.text;
        if (text.isNumericOnly) {
          return element.cod.isCaseInsensitiveContainsAny(text);
        }
        return element.truckDriver.isCaseInsensitiveContainsAny(text);
      }).toList();
    });
  }

  @override
  void onClose() {
    super.onClose();
    fieldController.dispose();
  }

  Future<void> getInitData() async {
    (await listTruckDriversCase(const Params())).fold(
      (l) => null,
      (r) => {
        _list = r,
        listFiltred.value = r,
      },
    );
  }

  void toDetailPage(TruckDriversEntity e) {
    Get.toNamed('${Routes.truckDrivers.path}/${e.cod}');
  }
}
