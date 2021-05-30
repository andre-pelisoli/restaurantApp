import 'package:flutter/material.dart';
import 'package:restaurantApp/components/meal_item.dart';
import 'package:restaurantApp/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen({this.favoriteMeals});

  void onItemClicked(BuildContext context, Meal meal) {}

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text('None meal was added as favorite'),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index], onItemClicked);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
