import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:supermarkt_vergelijker/models/product_suggestion.dart';

import '../models/product.dart';
import '../models/store.dart';
import '../utils/api_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showFilters = false;
  List<ProductSuggestion> _productSuggestions = [];
  List<Product> _products = [];
  ProductSuggestion? _selectedProductSuggestion;

  Store? _selectedStore;
  String? _selectedLocation;
  String? _selectedBrand;
  String? _selectedType;
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Supermarkt vergelijker'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  String query = textEditingValue.text;

                  // Don't show suggestions on empty input
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }

                  // Fetching suggestions from your APIHelper class
                  _productSuggestions =
                      await APIHelper.getProductSuggestions(query);

                  // Returning the list of suggestions
                  return _productSuggestions.map((e) => e.name);
                },
                onSelected: (String selection) {
                  // Handle what happens when a suggestion is selected
                  setState(() {
                    _selectedProductSuggestion = _productSuggestions
                        .firstWhere((element) => element.name == selection);
                  });
                },
              ),
            ),
            PlatformElevatedButton(
              child: Text(_showFilters ? 'Hide Filters' : 'Show Filters'),
              onPressed: () {
                setState(() {
                  _showFilters = !_showFilters;
                });
              },
            ),
            if (_showFilters) ...[
              Wrap(
                  spacing: 8.0, // Horizontal space between chips
                  runSpacing: 4.0, // Vertical space between runs
                  children: [
                    DropdownButton<String>(
                      hint: Text(_selectedStore?.name ?? 'Winkel'),
                      items: _selectedProductSuggestion?.stores.map((store) {
                        return DropdownMenuItem<String>(
                          value: store.name,
                          child: Text(store.name),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedStore = _selectedProductSuggestion?.stores
                              .firstWhere(
                                  (element) => element.name == newValue);

                          // If the brand or location is present in the new store, keep the selected value
                          if (_selectedBrand != null &&
                              !_selectedStore!.brands
                                  .contains(_selectedBrand)) {
                            _selectedBrand = null;
                          }

                          if (_selectedLocation != null &&
                              !_selectedStore!.locations
                                  .contains(_selectedLocation)) {
                            _selectedLocation = null;
                          }

                          applyFilters();
                        });
                      },
                    ),
                    DropdownButton<String>(
                      hint: Text(_selectedLocation ?? 'Locatie'),
                      items: _selectedStore?.locations.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          applyFilters();
                        });
                      },
                    ),
                    DropdownButton<String>(
                      hint: Text(_selectedBrand ?? 'Merk'),
                      items: _selectedStore?.brands.map((brand) {
                        return DropdownMenuItem<String>(
                          value: brand,
                          child: Text(brand),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedBrand = newValue;
                          applyFilters();
                        });
                      },
                    ),
                    DropdownButton<String>(
                      hint: Text(_selectedType ?? 'Soort'),
                      items: _selectedProductSuggestion?.types.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedType = newValue;
                          applyFilters();
                        });
                      },
                    ),
                    DropdownButton<String>(
                      hint: Text(_selectedSize ?? 'Grootte'),
                      items: _selectedProductSuggestion?.sizes.map((size) {
                        return DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSize = newValue;
                          applyFilters();
                        });
                      },
                    ),
                  ])
            ],
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(
                        'Package: ${product.fullPrice} - Unit: ${product.pricePerUnit}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void applyFilters() async {
    var products = await APIHelper.getProducts(
      _selectedProductSuggestion!.name,
      _selectedStore?.name,
      _selectedLocation,
      _selectedBrand,
      _selectedType,
      _selectedSize,
    );

    setState(() async {
      _products = products;
    });
  }
}
