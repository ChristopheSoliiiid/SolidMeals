import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealInformations extends StatelessWidget {
  final Meal meal;

  const MealInformations({
    Key key,
    @required this.meal,
  }) : super(key: key);

  Widget buildInformation({Icon icon, Text text}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 6),
          text,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildInformation(
            icon: Icon(
              Icons.schedule,
              color: meal.durationColor,
            ),
            text: Text('${meal.duration} min'),
          ),
          buildInformation(
            icon: Icon(
              Icons.kitchen,
              color: meal.complexityColor,
            ),
            text: Text('${meal.complexityText}'),
          ),
          buildInformation(
            icon: Icon(
              Icons.attach_money,
              color: meal.affordabilityColor,
            ),
            text: Text('${meal.affordabilityText}'),
          ),
        ],
      ),
    );
  }
}
