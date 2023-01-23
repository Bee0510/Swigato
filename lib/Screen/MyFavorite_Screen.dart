// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:swigito/Models/Meal.dart';
import '../Extra_Styling/Meal_List.dart';
import '../Widgets/Single_meal_Item.dart';

class MyFavoriteScreen extends StatelessWidget {
  final List<Meal> FavoriteMeal;
  MyFavoriteScreen(this.FavoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (FavoriteMeal.isEmpty) {
      return Center(
        child: Text('Favorite'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return SingleMealItem(
              id: FavoriteMeal[index].id,
              titleOfItems: FavoriteMeal[index].titleOfItems,
              ImageURL: FavoriteMeal[index].ImageURL,
              complexity: FavoriteMeal[index].comlexity,
              duration: FavoriteMeal[index].duration,
              affordobility: FavoriteMeal[index].affordable,
            );
          },
          itemCount: FavoriteMeal.length);
    }
  }
}
