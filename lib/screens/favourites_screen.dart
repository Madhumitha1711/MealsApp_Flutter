import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  final Function toggleFavourites;
  final Function isFav;

  List<Meal> favouriteMeals;
  FavouritesScreen({
    this.favouriteMeals,
    this.toggleFavourites,
    this.isFav,
  });

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty)
      return Center(
        child: Text('You have no favouriotes start adding some'),
      );
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            title: widget.favouriteMeals[index].title,
            imageUrl: widget.favouriteMeals[index].imageUrl,
            complexity: widget.favouriteMeals[index].complexity,
            affordability: widget.favouriteMeals[index].affordability,
            duration: widget.favouriteMeals[index].duration,
            isFav: widget.isFav,
            toggleFavourites: widget.toggleFavourites,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
