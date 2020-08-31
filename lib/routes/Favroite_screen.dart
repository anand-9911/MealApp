import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavroiteScreen extends StatelessWidget {
  final List<Meal> favMeals;
  FavroiteScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('No Favourite Meals'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favMeals[index].title,
            affordability: favMeals[index].affordability,
            complexity: favMeals[index].complexity,
            duration: favMeals[index].duration,
            imageUrl: favMeals[index].imageUrl,
            id: favMeals[index].id,
            ingredients: favMeals[index].ingredients,
            steps: favMeals[index].steps,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
