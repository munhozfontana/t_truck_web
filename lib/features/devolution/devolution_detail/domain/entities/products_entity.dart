class ProductsEntity {
  final int cod;
  final String name;
  final int quantity;
  final num price;
  final num priceMount;

  ProductsEntity({
    required this.cod,
    this.name = 'Sem informação',
    required this.quantity,
    required this.price,
    required this.priceMount,
  });
}
