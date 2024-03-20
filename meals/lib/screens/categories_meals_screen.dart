// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals, {super.key});
  
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}