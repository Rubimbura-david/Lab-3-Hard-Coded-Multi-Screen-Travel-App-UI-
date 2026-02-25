import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/data/travel_data.dart';
import 'package:travel_app/widgets/destination_card.dart';
import 'package:travel_app/widgets/category_chip.dart';
import 'package:travel_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Destination> _destinations = [];
  List<Map<String, dynamic>> _categories = [];
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("✅ HomeScreen initState called");
    _loadData();
  }

  void _loadData() {
    print("📊 Loading data...");
    setState(() {
      _destinations = TravelData.getAllDestinations();
      _categories = TravelData.getCategories();
      print("📊 Loaded ${_destinations.length} destinations");
      print("📊 Loaded ${_categories.length} categories");
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _destinations = TravelData.getAllDestinations();
      } else {
        _destinations = TravelData.getDestinationsByCategory(category);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("🏗️ Building HomeScreen");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visit Rwanda 🇷🇼',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Favorites coming soon!')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
          ),
        ],
      ),

      body: _destinations.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          : Column(
              children: [
                // Search Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search destinations in Rwanda...',
                      prefixIcon: const Icon(Icons.search, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                ),

                // Categories
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CategoryChip(
                          label: 'All',
                          icon: '🌟',
                          isSelected: _selectedCategory == 'All',
                          onTap: () => _filterByCategory('All'),
                        );
                      }
                      final category = _categories[index - 1];
                      return CategoryChip(
                        label: category['name'],
                        icon: category['icon'],
                        isSelected: _selectedCategory == category['name'],
                        onTap: () => _filterByCategory(category['name']),
                      );
                    },
                  ),
                ),

                // Destinations Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: _destinations.length,
                    itemBuilder: (context, index) {
                      final destination = _destinations[index];
                      return DestinationCard(
                        destination: destination,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(destination: destination),
                            ),
                          );
                        },
                        onFavoriteToggle: () {
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
