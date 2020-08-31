import 'package:flutter/material.dart';
import '../routes/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  void selectMealScreen(BuildContext ctx) {
    //1st way to make use of Routes
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(title, id);
    //     },
    //   ),
    // );

    //2nd way to make use of NamedRoutes for better management.
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMealScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
