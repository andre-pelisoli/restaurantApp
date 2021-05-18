import 'package:flutter/material.dart';
import 'package:restaurantApp/screens/meal_detail_screen.dart';
import 'package:restaurantApp/screens/meal_screen.dart';
import 'package:restaurantApp/screens/routes/app_routes.dart';
import 'package:restaurantApp/screens/settings_screen.dart';
import 'package:restaurantApp/screens/tabs_screen.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _applyFilterSettings(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

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
        AppRoutes.HOME: (ctx) => TabScreen(),
        AppRoutes.MEALS: (ctx) => MealScreen(_availableMeals),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) =>
            SettingsScreen(_applyFilterSettings, settings),
      },
    );
  }
}
