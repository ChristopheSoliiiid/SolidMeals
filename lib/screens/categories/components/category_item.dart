import 'package:flutter/material.dart';

import '../../category/category_meals.dart';
import '../../../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int mealCounter;

  CategoryItem(this.category, this.mealCounter);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMeals.routeName,
      arguments: {
        'id': category.id,
        'title': category.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        category.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  category.imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [category.color.withOpacity(0.7), category.color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
        Positioned(
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Positioned(
          top: 50,
          child: Container(
            padding: EdgeInsets.only(top: 0, right: 7, bottom: 3, left: 7),
            color: Colors.white70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  mealCounter.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.restaurant_menu,
                  size: 18,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        // Pour l'effet lors du "clic"
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => selectCategory(context),
              splashColor: Theme.of(context).primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        )
      ],
    );
  }
}
