import 'package:supermarkt_vergelijker/models/store.dart';

class ProductSuggestion {
  final String name;

  // Filters
  final List<Store> stores;
  final List<String> types;
  final List<String> sizes;

  ProductSuggestion({
    required this.name,
    required this.stores,
    required this.types,
    required this.sizes,
  });

  factory ProductSuggestion.fromJson(Map<String, dynamic> json) {
    print(json['stores'].runtimeType);
    return ProductSuggestion(
      name: json['name'],
      stores: (json['stores'] as List<dynamic>).map((store) => Store.fromJson(store)).toList(),
      types: (json['types'] as List<dynamic>).map((type) => type.toString()).toList(),
      sizes: (json['sizes'] as List<dynamic>).map((size) => size.toString()).toList(),
    );
  }

  static ProductSuggestion example() {
    return ProductSuggestion(
      name: 'Ei',
      stores: Store.exampleList(),
      types: ['Vrije uitloop', 'Scharrel'],
      sizes: ['Per 6', 'Per 12'],
    );
  }

  static List<ProductSuggestion> exampleList() {
    return [
      ProductSuggestion(
        name: 'Ei',
        stores: Store.exampleList(),
        types: ['Vrije uitloop', 'Scharrel'],
        sizes: ['Per 6', 'Per 12'],
      ),
      ProductSuggestion(
        name: 'Melk',
        stores: Store.exampleList(),
        types: ['Mager', 'Halfvol', 'Vol'],
        sizes: ['500ml', '1L'],
      ),
    ];
  }
}