import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> displaymeals;

  CategoryMealsScreen(this.displaymeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'] as String;
    
    final categorymealsfilter = widget.displaymeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              categorymealsfilter[index].id,
              categorymealsfilter[index].title,
              categorymealsfilter[index].imageUrl,
              categorymealsfilter[index].duration,
              categorymealsfilter[index].complexity,
              categorymealsfilter[index].affordability);
        },
        itemCount: categorymealsfilter.length,
      ),
    );
  }
}
