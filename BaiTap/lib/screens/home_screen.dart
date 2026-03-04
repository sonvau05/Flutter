import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../models/category_model.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_card.dart';
import '../utils/constants.dart';
import 'food_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Category> categories;
  late List<FoodItem> filteredFoods;
  late List<FoodItem> allFoods;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    allFoods = DummyData.foods;
    categories = DummyData.categories.map((cat) {
      return Category(name: cat.name, isSelected: cat.name == 'Popular');
    }).toList();
    _updateFilteredFoods();
  }

  void _updateFilteredFoods() {
    setState(() {
      // Lọc theo category được chọn
      String selectedCategory = categories.firstWhere((cat) => cat.isSelected).name;
      List<FoodItem> categoryFiltered = DummyData.getFoodsByCategory(selectedCategory);

      // Lọc theo từ khóa tìm kiếm
      if (_searchQuery.isEmpty) {
        filteredFoods = categoryFiltered;
      } else {
        filteredFoods = categoryFiltered.where((food)
        => food.name.toLowerCase().contains(_searchQuery.toLowerCase())
        ).toList();
      }
    });
  }

  void selectCategory(int index) {
    setState(() {
      for (int i = 0; i < categories.length; i++) {
        categories[i].isSelected = i == index;
      }
      _updateFilteredFoods();
    });
  }

  void showFoodDetail(FoodItem food) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FoodDetailScreen(
        food: food,
        onClose: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mark Adam',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      color: AppColors.textDark,
                      size: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search Bar - Có chức năng tìm kiếm
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _updateFilteredFoods();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Find Your Meal',
                    border: InputBorder.none,
                    icon: const Icon(Icons.search, color: AppColors.textLight),
                    hintStyle: const TextStyle(color: AppColors.textLight),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchQuery = '';
                          _updateFilteredFoods();
                        });
                      },
                    )
                        : null,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Categories Title
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Categories List
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CategoryChip(
                        label: categories[index].name,
                        isSelected: categories[index].isSelected,
                        onTap: () => selectCategory(index),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Hiển thị kết quả tìm kiếm
              if (_searchQuery.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Search results for "${_searchQuery}"',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

              // Food List
              filteredFoods.isEmpty
                  ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 60,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _searchQuery.isEmpty
                            ? 'No items in this category'
                            : 'No food found matching "$_searchQuery"',
                        style: const TextStyle(
                          color: AppColors.textLight,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredFoods.length,
                  itemBuilder: (context, index) {
                    final food = filteredFoods[index];
                    return FoodCard(
                      food: food,
                      onTap: () => showFoodDetail(food),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}