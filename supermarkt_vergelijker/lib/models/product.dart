class Product {
  final String name;
  final String store;
  final String location;
  final String brand;
  final String type;
  final String size;
  final double fullPrice;
  final double pricePerUnit;

  Product({
    required this.name,
    required this.store,
    required this.location,
    required this.brand,
    required this.type,
    required this.size,
    required this.fullPrice,
    required this.pricePerUnit,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      store: json['store'],
      location: json['location'],
      brand: json['brand'],
      type: json['type'],
      size: json['size'],
      fullPrice: json['fullPrice'].toDouble(),
      pricePerUnit: json['pricePerUnit'].toDouble(),
    );
  }
}