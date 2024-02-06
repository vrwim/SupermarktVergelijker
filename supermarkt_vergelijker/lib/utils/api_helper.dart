import 'package:supermarkt_vergelijker/models/product_suggestion.dart';

import '../models/product.dart';

class APIHelper {
  static Future<List<ProductSuggestion>> getProductSuggestions(String query) async {
    // Placeholder for your API call
    // This should return both suggestions and filter options relevant to the query
    return ProductSuggestion.exampleList();
  }

  static Future<List<Product>> getProducts(String productName, String? store, String? storeLocation, String? brand, String? type, String? size) async {
    // Placeholder for your API call
    // This should return a list of products that match the suggestion
    return Product.exampleList();
  }
}