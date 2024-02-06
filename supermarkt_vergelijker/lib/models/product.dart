import 'dart:ffi';

class Product {
  final String name;
  final String store;
  final String type;
  final String size;
  final double fullPrice;
  final double pricePerUnit;

  Product({
    required this.name,
    required this.store,
    required this.type,
    required this.size,
    required this.fullPrice,
    required this.pricePerUnit,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      store: json['store'],
      type: json['type'],
      size: json['size'],
      fullPrice: json['fullPrice'],
      pricePerUnit: json['pricePerUnit'],
    );
  }

  static Product example() {
    return Product(
      name: 'Ei',
      store: 'Colruyt',
      type: 'Vrije uitloop',
      size: 'Per 6',
      fullPrice: 1.5,
      pricePerUnit: 0.25,
    );
  }

  static List<Product> exampleList() {
    return [
      Product(
        name: 'Ei',
        store: 'Colruyt',
        type: 'Vrije uitloop',
        size: 'Per 6',
        fullPrice: 1.5,
        pricePerUnit: 0.25,
      ),
      Product(
        name: 'Melk',
        store: 'Colruyt',
        type: 'Mager',
        size: '1L',
        fullPrice: 1.5,
        pricePerUnit: 0.25,
      ),
    ];
  }
}