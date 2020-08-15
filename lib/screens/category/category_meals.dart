import 'package:flutter/material.dart';

import '../../components/meal_item.dart';
import '../../models/meal.dart';
import '../../components/main_drawer.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  final Map<String, bool> currentFilters;
  final Function saveFilters;

  CategoryMeals(this.availableMeals, this.currentFilters, this.saveFilters);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];

    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings, color: Colors.black54),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
      ),
      endDrawer: MainDrawer(widget.currentFilters, widget.saveFilters),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: displayedMeals[index]);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
