import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../components/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;

  Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(meal: favoriteMeals[index]);
          });
    }
  }
}
