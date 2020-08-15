import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Hard,
  Challenging,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'N/A';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'N/A';
    }
  }

  Color get durationColor {
    return duration <= 20
        ? Colors.green
        : (duration <= 45 ? Colors.orange : Colors.red);
  }

  Color get complexityColor {
    return complexity == Complexity.Simple
        ? Colors.green
        : (complexity == Complexity.Hard ? Colors.orange : Colors.red);
  }

  Color get affordabilityColor {
    return affordability == Affordability.Affordable
        ? Colors.green
        : (affordability == Affordability.Pricey ? Colors.orange : Colors.red);
  }
}
