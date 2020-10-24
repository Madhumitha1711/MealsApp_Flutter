import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categort_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              id: catData.id,
              title: catData.title,
              color: catData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
