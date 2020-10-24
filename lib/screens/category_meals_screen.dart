import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  final Function toggleFavourites;
  final Function isFav;

  CategoryMealsScreen({this.availableMeals,this.toggleFavourites,this.isFav});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String selectedmealId;

  void removeItem(String mealId) {
    setState(() {
      selectedmealId=mealId;
    }); 
    print('selected meal id'+selectedmealId);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = widget.availableMeals
        .where(
            (meal) => meal.categories.contains(categoryId) && meal.id != selectedmealId)
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              duration: categoryMeals[index].duration,
              removeItem: removeItem,
              isFav: widget.isFav ,
              toggleFavourites: widget.toggleFavourites,


            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
