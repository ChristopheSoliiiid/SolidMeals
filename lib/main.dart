import 'package:flutter/material.dart';

import 'theme/style.dart';
import 'models/meal.dart';
import 'services/dummy_data.dart';
import 'screens/tabs/tabs.dart';
import 'screens/categories/categories.dart';
import 'screens/category/category_meals.dart';
import 'screens/meal/meal_detail.dart';
import 'screens/filters/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      routes: {
        '/': (context) => Tabs(_favoriteMeals),
        CategoryMeals.routeName: (context) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (context) =>
            MealDetail(_toggleFavorite, _isMealFavorite),
        Filters.routeName: (context) => Filters(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Categories());
      },
    );
  }
}
