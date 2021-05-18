import 'package:flutter/material.dart';
import 'package:restaurantApp/components/meal_item.dart';
import 'package:restaurantApp/models/category.dart';
import 'package:restaurantApp/models/meal.dart';
import 'package:restaurantApp/screens/routes/app_routes.dart';

class MealScreen extends StatelessWidget {
  final List<Meal> meals;

  const MealScreen(this.meals);

  void _onMealClicked(BuildContext context, Meal meal) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAILS,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index], _onMealClicked);
        },
      ),
    );
  }
}
