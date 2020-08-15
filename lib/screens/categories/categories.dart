import 'package:flutter/material.dart';

import '../../services/dummy_data.dart';
import 'components/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map(
              (categoryData) => CategoryItem(
                categoryData.id,
                categoryData.title,
                categoryData.color,
                categoryData.imageUrl,
              ),
            )
            .toList(),
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
