// Model class for Destination following OOP principles
class Destination {
  // Private fields with getters (encapsulation)
  final String _name;
  final String _location;
  final String _description;
  final double _price;
  final double _rating;
  final String _imagePath;
  final bool _isFavorite;

  // Constructor with named parameters
  Destination({
    required String name,
    required String location,
    required String description,
    required double price,
    required double rating,
    required String imagePath,
    bool isFavorite = false,
  }) : _name = name,
       _location = location,
       _description = description,
       _price = price,
       _rating = rating,
       _imagePath = imagePath,
       _isFavorite = isFavorite;

  // Getters
  String get name => _name;
  String get location => _location;
  String get description => _description;
  double get price => _price;
  double get rating => _rating;
  String get imagePath => _imagePath;
  bool get isFavorite => _isFavorite;

  // Method to create a copy with modified fields
  Destination copyWith({
    String? name,
    String? location,
    String? description,
    double? price,
    double? rating,
    String? imagePath,
    bool? isFavorite,
  }) {
    return Destination(
      name: name ?? _name,
      location: location ?? _location,
      description: description ?? _description,
      price: price ?? _price,
      rating: rating ?? _rating,
      imagePath: imagePath ?? _imagePath,
      isFavorite: isFavorite ?? _isFavorite,
    );
  }
}
