class FoodItem {
  final String name;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;
  final String category;
  final int prepTime;
  final double distance;
  final List<String> ingredients;

  FoodItem({
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.prepTime,
    required this.distance, // Thêm
    required this.ingredients,
  });
}