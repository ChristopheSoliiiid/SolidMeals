import 'package:flutter/material.dart';

import '../../services/dummy_data.dart';
import 'components/category_item.dart';
import '../../models/meal.dart';

class Categories extends StatelessWidget {
  final List<Meal> availableMeals;

  Categories(this.availableMeals);

  int countMeals(String categoryId) {
    int counter = 0;

    for (var meal in availableMeals) {
      if (meal.categories.contains(categoryId)) {
        counter++;
      }
    }

    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map(
          (category) {
            int mealCounter = countMeals(category.id);

            return CategoryItem(category, mealCounter);
          },
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
