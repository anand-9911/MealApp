import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItemDetails extends StatelessWidget {
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  MealItemDetails({
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'unknown';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(Icons.alarm),
                SizedBox(
                  width: 6,
                ),
                Text('$duration mins'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.monetization_on),
                SizedBox(
                  width: 6,
                ),
                Text(affordabilityText),
              ],
            ),
            Row(
              children: [
                Icon(Icons.work),
                SizedBox(
                  width: 6,
                ),
                Text(complexityText),
              ],
            ),
          ],
        ));
  }
}
