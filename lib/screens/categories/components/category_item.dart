import 'package:flutter/material.dart';

import '../../category/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color backgroundColor;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.backgroundColor, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMeals.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [backgroundColor.withOpacity(0.7), backgroundColor],
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
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
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
