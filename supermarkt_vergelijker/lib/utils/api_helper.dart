import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_suggestion.dart';
import '../models/product.dart';

class APIHelper {
  static const String baseUrl = 'http://127.0.0.1:8080';

  static Future<List<ProductSuggestion>> getProductSuggestions(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/productSuggestions?query=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductSuggestion.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load product suggestions');
    }
  }

  static Future<List<Product>> getProducts({String? productName, String? store, String? brand, String? location, String? type, String? size}) async {
    // Define the base URL.
    var uri = Uri.parse('$baseUrl/products');

    // Add query parameters.
    var queryParams = {
      if (productName != null) 'productName': productName,
      if (store != null) 'store': store,
      if (location != null) 'storeLocation': location,
      if (brand != null) 'brand': brand,
      if (type != null) 'type': type,
      if (size != null) 'size': size,
    };

    // Construct the URI with query parameters.
    final uriWithParams = uri.replace(queryParameters: queryParams);

    final response = await http.get(uriWithParams);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}