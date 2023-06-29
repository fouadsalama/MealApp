import 'package:flutter/material.dart';

import '../modules/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;

  const FavoritesScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return const Center(
        child: Text('you have no favorites yet  _start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: favoritesMeal[index].id,
            imageUrl: favoritesMeal[index].imageUrl,
            title: favoritesMeal[index].title,
            duration: favoritesMeal[index].duration,
            affordability: favoritesMeal[index].affordability,
            complexity: favoritesMeal[index].complexity,
          );
        },
        itemCount: favoritesMeal.length,
      );
    }
  }
}
