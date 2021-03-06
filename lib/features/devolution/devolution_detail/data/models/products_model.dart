import 'dart:convert';

import 'package:t_truck_web/features/devolution/devolution_detail/domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  final int numPedido;

  ProductsModel({
    required int cod,
    required String name,
    required int quantity,
    required num price,
    required num priceMount,
    required this.numPedido,
  }) : super(
          cod: cod,
          name: name,
          quantity: quantity,
          price: price,
          priceMount: priceMount,
        );

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      cod: map['CODPROD'] as int,
      name: map['DESCRICAO'] as String,
      price: map['VL_UNIDADE'] as num,
      priceMount: map['VLTOTAL'] as num,
      quantity: map['QT'] as int,
      numPedido: map['NUMPED'] as int,
    );
  }

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
