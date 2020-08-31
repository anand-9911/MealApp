import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  final List<Meal> avaliableMeals;
  CategoryMealsScreen(this.avaliableMeals);
  // final String mealTitle;
  // final String mealId;

  // CategoryMealsScreen(this.mealTitle, this.mealId);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categortId = routeArgs['id'];
    final categoryMeal = avaliableMeals.where((meal) {
      return meal.categories.contains(categortId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeal[index].title,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration,
            imageUrl: categoryMeal[index].imageUrl,
            id: categoryMeal[index].id,
            ingredients: categoryMeal[index].ingredients,
            steps: categoryMeal[index].steps,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
