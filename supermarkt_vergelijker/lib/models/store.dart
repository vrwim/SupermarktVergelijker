class Store {
  final String name;
  final List<String> locations;
  final List<String> brands;

  Store({
    required this.name,
    required this.locations,
    required this.brands,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      locations: json['locations'].map<String>((location) => location.toString()).toList(),
      brands: json['brands'].map<String>((location) => location.toString()).toList(),
    );
  }

  static Store example() {
    return Store(
      name: 'Colruyt',
      locations: ['Gent', 'Oostende'],
      brands: ['Boni', 'Everyday'],
    );
  }

  static List<Store> exampleList() {
    return [
      Store(
        name: 'Colruyt',
        locations: ['Gent', 'Oostende'],
        brands: ['Boni', 'Everyday'],
      ),
      Store(
        name: 'Albert Heijn',
        locations: ['Gent', 'Oostende'],
        brands: ['AH', 'AH Basic'],
      ),
    ];
  }
}