import 'package:flutter/material.dart';
import 'package:restaurantApp/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Function(BuildContext context, Category category) onClick;

  const CategoryItem(this.category, this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(context, category),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
