import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/routes/category_meals_screen.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildMealSwitch(
      String title, String subtitle, bool value, Function onValueChange) {
    return SwitchListTile(
      value: value,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      onChanged: onValueChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          FlatButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
              };

              widget.saveFilters(selectedFilter);
            },
            child: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Filter your results',
                style: Theme.of(context).textTheme.title),
          ),
          _buildMealSwitch(
            'Glutten Free',
            'Meals that are free from Gluten',
            _glutenFree,
            (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          _buildMealSwitch(
            'Lactose Free',
            'Meals that are free from Lactose',
            _lactoseFree,
            (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          _buildMealSwitch(
            'Vegan Meals',
            'Meals that are  Vegan',
            _vegan,
            (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
          _buildMealSwitch(
            'Vegetraian Meal',
            'Meals that are Vegetraian',
            _vegetarian,
            (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
