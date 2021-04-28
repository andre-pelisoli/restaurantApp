import 'package:flutter/material.dart';
import 'package:restaurantApp/components/category_item_widget.dart';
import 'package:restaurantApp/data/dummy_data.dart';
import 'package:restaurantApp/models/category.dart';
import 'package:restaurantApp/screens/routes/app_routes.dart';

class CategoryScreen extends StatelessWidget {
  void _onClick(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((categoryDummy) {
          return CategoryItem(categoryDummy, _onClick);
        }).toList());
  }
}
