import 'package:flutter/material.dart';

import '../modules/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = 'category_meals';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  // const CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? categoryMeals;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    categoryMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: categoryMeals![index].id,
            imageUrl: categoryMeals![index].imageUrl,
            title: categoryMeals![index].title,
            duration: categoryMeals![index].duration,
            affordability: categoryMeals![index].affordability,
            complexity: categoryMeals![index].complexity,
          );
        },
        itemCount: categoryMeals?.length,
      ),
    );
  }
}
