import 'package:travel_app/models/destination.dart';

class TravelData {
  // Static method to get all Rwandan destinations
  static List<Destination> getAllDestinations() {
    return [
      Destination(
        name: 'Volcanoes National Park',
        location: 'Musanze, Rwanda',
        description:
            'Home to the majestic mountain gorillas, this park offers unforgettable gorilla trekking experiences. Explore lush rainforests and witness endangered mountain gorillas in their natural habitat. Also features golden monkeys and the stunning Mount Bisoke.',
        price: 1500000,
        rating: 5.0,
        imagePath: 'assets/images/volcano.jpg', // Changed to match your file
        isFavorite: true,
      ),
      Destination(
        name: 'Lake Kivu',
        location: 'Rubavu, Rwanda',
        description:
            'One of Africa\'s Great Lakes, offering beautiful beaches, boat rides, and stunning sunsets. Enjoy kayaking, jet skiing, and relaxing at lakeside resorts. Visit the famous Napoleon Island and experience the vibrant local fishing communities.',
        price: 350000,
        rating: 4.8,
        imagePath: 'assets/images/Lake_Kivu.jpg', 
        isFavorite: false,
      ),
      Destination(
        name: 'Nyungwe Forest National Park',
        location: 'Nyungwe, Rwanda',
        description:
            'Ancient montane rainforest with chimpanzee tracking, canopy walks, and over 300 bird species. Experience the suspended canopy walkway 50m above ground, discover waterfalls, and learn about medicinal plants used by local communities.',
        price: 450000,
        rating: 4.9,
        imagePath: 'assets/images/nyungwe.jpg',
        isFavorite: true,
      ),
      Destination(
        name: 'Akagera National Park',
        location: 'Eastern Province, Rwanda',
        description:
            'Rwanda\'s only Big Five safari destination. Witness lions, elephants, rhinos, leopards, and buffalo. Enjoy boat safaris on Lake Ihema, spot hippos and crocodiles, and experience stunning savannah landscapes.',
        price: 400000,
        rating: 4.7,
        imagePath: 'assets/images/akagera.jpg', // This matches!
        isFavorite: false,
      ),
      Destination(
        name: 'Kigali City',
        location: 'Kigali, Rwanda',
        description:
            'Africa\'s cleanest city, blending modernity with culture. Visit the Kigali Genocide Memorial, explore vibrant markets, enjoy world-class restaurants, and experience the thriving arts scene at Inema Arts Center.',
        price: 200000,
        rating: 4.6,
        imagePath: 'assets/images/kigali.jpg', // This matches!
        isFavorite: false,
      ),
      Destination(
        name: 'Musanze Caves',
        location: 'Musanze, Rwanda',
        description:
            'Fascinating lava tubes formed by volcanic activity. Explore underground tunnels, learn about their historical use as shelters, and discover unique rock formations. A perfect adventure for geology enthusiasts.',
        price: 150000,
        rating: 4.5,
        imagePath: 'assets/images/musanze.jpg', // Changed to match your file
        isFavorite: false,
      ),
      Destination(
        name: 'King\'s Palace Museum',
        location: 'Nyanza, Rwanda',
        description:
            'Traditional royal residence showcasing Rwandan culture. View the sacred Inyambo cows with their magnificent horns, explore the reconstructed palace, and learn about ancient Rwandan monarchy and traditions.',
        price: 80000,
        rating: 4.6,
        imagePath: 'assets/images/kigalipalacemuseum.jpg',
        isFavorite: false,
      ),
      Destination(
        name: 'Gishwati-Mukura National Park',
        location: 'Western Province, Rwanda',
        description:
            'Rwanda\'s newest national park, a conservation success story. Hike through restored forests, spot chimpanzees and L\'Hoest monkeys, and learn about community-led conservation efforts.',
        price: 300000,
        rating: 4.7,
        imagePath:
            'assets/images/Gishwati_Forest.jpg', // Changed to match your file
        isFavorite: false,
      ),
    ];
  }

  // Rest of the methods remain the same
  static List<Map<String, dynamic>> getCategories() {
    return [
      {'name': 'National Parks', 'icon': '🏞️'},
      {'name': 'Lakes & Beaches', 'icon': '🏖️'},
      {'name': 'Mountains', 'icon': '🏔️'},
      {'name': 'Wildlife', 'icon': '🦁'},
      {'name': 'Cultural', 'icon': '🏛️'},
      {'name': 'Cities', 'icon': '🌆'},
      {'name': 'Adventure', 'icon': '🧗'},
      {'name': 'Historical', 'icon': '📜'},
    ];
  }

  static Destination? getDestinationByName(String name) {
    try {
      return getAllDestinations().firstWhere((dest) => dest.name == name);
    } catch (e) {
      return null;
    }
  }

  static List<Destination> getFeaturedDestinations() {
    var all = getAllDestinations();
    all.sort((a, b) => b.rating.compareTo(a.rating));
    return all.take(4).toList();
  }

  static List<Destination> getDestinationsByCategory(String category) {
    switch (category) {
      case 'National Parks':
        return getAllDestinations()
            .where(
              (dest) =>
                  dest.name.contains('Park') || dest.name.contains('Forest'),
            )
            .toList();
      case 'Lakes & Beaches':
        return getAllDestinations()
            .where((dest) => dest.name.contains('Lake'))
            .toList();
      case 'Cultural':
        return getAllDestinations()
            .where(
              (dest) =>
                  dest.name.contains('Palace') || dest.name.contains('Museum'),
            )
            .toList();
      default:
        return getAllDestinations();
    }
  }
}
