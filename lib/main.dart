import 'package:flutter/material.dart';
import 'package:restaurantApp/screens/category_screen.dart';
import 'package:restaurantApp/screens/meal_screen.dart';
import 'package:restaurantApp/screens/routes/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoutes.HOME: (ctx) => CategoryScreen(),
        AppRoutes.MEALS: (ctx) => Meal(),
      },
    );
  }
}