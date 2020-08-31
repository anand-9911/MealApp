import 'package:flutter/material.dart';
import './models/meal.dart';
import './dummy_data.dart';
import './routes/filter_screen.dart';
import './routes/tabs_screen.dart';
import './routes/meal_detail_screen.dart';
import 'routes/category_meals_screen.dart';

import 'routes/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  void _selectedFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggelFavMeal(String mealId) {
    final _existingMealIndex =
        _favMeals.indexWhere((meal) => meal.id == mealId);
    if (_existingMealIndex >= 0) {
      setState(() {
        _favMeals.removeAt(_existingMealIndex);
      });
    } else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFav(String mealId) {
    return _favMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      // home: CategoriesScreen(),

      routes: {
        '/': (ctx) => TabsScreen(_favMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_avaliableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggelFavMeal, _isMealFav),
        FilterScreen.routeName: (ctx) =>
            FilterScreen(_filters, _selectedFilters),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => CategoriesScreen()),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'RaleWay',
          textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              // ignore: deprecated_member_use
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              // ignore: deprecated_member_use
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
    );
  }
}
