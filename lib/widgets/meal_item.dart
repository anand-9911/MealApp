import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/routes/meal_detail_screen.dart';
import '../models/meal.dart';
import './meal_item_details.dart';

class MealItem extends StatelessWidget {
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final String id;

  MealItem({
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.id,
    @required this.ingredients,
    @required this.steps,
  });

  void selectMealDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: {
      'title': title,
      'id': id,
      'ingredients': ingredients,
      'steps': steps,
      'imageUrl': imageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMealDetails(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 300,
                    child: Text(
                      title,
                      softWrap: true,
                      style: TextStyle(
                          backgroundColor: Colors.black54,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            MealItemDetails(
              affordability: affordability,
              complexity: complexity,
              duration: duration,
            )
          ],
        ),
      ),
    );
  }
}
