import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../models/category_model.dart';

class AppColors {
  static const Color primary = Color(0xFF4CAF50);
  static const Color background = Colors.white;
  static const Color textDark = Color(0xFF2E3E4E);
  static const Color textLight = Color(0xFF8392A5);
  static const Color ratingBg = Color(0xFFFFEAD0);
  static const Color cardBg = Colors.white;
}

class DummyData {
  static List<Category> categories = [
    Category(name: 'Popular'),
    Category(name: 'Indian'),
    Category(name: 'Chinese'),
  ];

  static final List<FoodItem> foods = [
    FoodItem(
      name: 'Sandwich',
      price: 50.00,
      rating: 4.5,
      imageUrl: ' ',
      category: 'Popular',
      prepTime: 15,
      distance: 1.2,
      description: 'A delicious sandwich with fresh vegetables and grilled chicken, served with special sauce.',
      ingredients: ['Bread', 'Chicken', 'Lettuce', 'Tomato', 'Mayonnaise'],
    ),
    FoodItem(
      name: 'Kebab',
      price: 25.00,
      rating: 4.2,
      imageUrl: ' ',
      category: 'Indian',
      prepTime: 20,
      distance: 2.5,
      description: 'Spicy grilled meat wrapped in soft bread with fresh vegetables and yogurt sauce.',
      ingredients: ['Meat', 'Pita Bread', 'Onion', 'Tomato', 'Yogurt Sauce'],
    ),
    FoodItem(
      name: 'Juice',
      price: 80.00,
      rating: 3.9,
      imageUrl: ' ',
      category: 'Popular',
      prepTime: 5,
      distance: 0.8,
      description: 'Freshly squeezed orange juice with a hint of mint, served cold.',
      ingredients: ['Orange', 'Mint', 'Ice', 'Honey'],
    ),
    FoodItem(
      name: 'Egg Items',
      price: 250.00,
      rating: 4.0,
      imageUrl: ' ',
      category: 'Chinese',
      prepTime: 25,
      distance: 3.1,
      description: 'Scrambled eggs with mushrooms, bell peppers, and spring onions in special sauce.',
      ingredients: ['Eggs', 'Mushrooms', 'Bell Peppers', 'Spring Onion', 'Soy Sauce'],
    ),
    FoodItem(
      name: 'Pizza',
      price: 180.00,
      rating: 4.8,
      imageUrl: ' ',
      category: 'Popular',
      prepTime: 30,
      distance: 2.0,
      description: 'Italian pizza with cheese, pepperoni, and mushrooms.',
      ingredients: ['Dough', 'Cheese', 'Pepperoni', 'Mushrooms', 'Tomato Sauce'],
    ),
    FoodItem(
      name: 'Burger',
      price: 65.00,
      rating: 4.3,
      imageUrl: ' ',
      category: 'Popular',
      prepTime: 18,
      distance: 1.5,
      description: 'Beef burger with lettuce, tomato, and special sauce.',
      ingredients: ['Bun', 'Beef Patty', 'Lettuce', 'Tomato', 'Cheese'],
    ),
    FoodItem(
      name: 'Fried Rice',
      price: 95.00,
      rating: 4.1,
      imageUrl: ' ',
      category: 'Chinese',
      prepTime: 15,
      distance: 2.8,
      description: 'Chinese fried rice with eggs and vegetables.',
      ingredients: ['Rice', 'Eggs', 'Carrots', 'Peas', 'Soy Sauce'],
    ),
    FoodItem(
      name: 'Curry',
      price: 150.00,
      rating: 4.6,
      imageUrl: ' ',
      category: 'Indian',
      prepTime: 35,
      distance: 3.5,
      description: 'Spicy Indian curry with chicken and traditional spices.',
      ingredients: ['Chicken', 'Curry Powder', 'Coconut Milk', 'Onion', 'Garlic'],
    ),
  ];

  static List<FoodItem> getFoodsByCategory(String category) {
    if (category == 'Popular') {
      return foods.where((food) => food.rating >= 4.0).toList();
    }
    return foods.where((food) => food.category == category).toList();
  }
}