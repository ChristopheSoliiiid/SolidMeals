import 'package:flutter/material.dart';

import '../../services/dummy_data.dart';
import '../../components/meal_informations.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetail(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      width: MediaQuery.of(context).size.width < 500
          ? MediaQuery.of(context).size.width
          : 600,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 3,
          blurRadius: 8,
          offset: Offset(0, 4),
        )
      ]),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            MealInformations(meal: selectedMeal),
            Divider(),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(selectedMeal.ingredients[index]),
                    ],
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child:
            Icon(isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
    );
  }
}
