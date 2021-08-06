import 'dart:math';

import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';

class DevolutionDetailController extends GetxController {
  RxList<ProductsEntity> list = <ProductsEntity>[].obs;

  @override
  void onInit() {
    final faker = Faker();
    list.value = List.generate(
      20,
      (index) => ProductsEntity(
        cod: index,
        name: faker.food.cuisine(),
        quantity: Random().nextInt(37),
        price: Random().nextInt(500),
        priceMount: Random().nextInt(2000),
      ),
    );
    super.onInit();
  }
}
