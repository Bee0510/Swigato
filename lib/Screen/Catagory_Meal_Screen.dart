// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, missing_return, unused_import, duplicate_import, missing_required_param, unrelated_type_equality_checks
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swigito/Models/Meal.dart';
import 'package:swigito/Widgets/Single_meal_Item.dart';
import 'Catagories_Screen.dart';
import '../Models/Meal.dart';

class MyCatagoryMealScreen extends StatefulWidget {
  final List<Meal> AvailableMeal;
  MyCatagoryMealScreen(this.AvailableMeal);
  @override
  State<MyCatagoryMealScreen> createState() => _MyCatagoryMealScreenState();
}

class _MyCatagoryMealScreenState extends State<MyCatagoryMealScreen> {
  String CatagoryTitle;
  List<Meal> displayedMeal;
  bool IsLoaded = false;

  @override
  void didChangeDependencies() {
    if (IsLoaded == false) {
      final routearg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      CatagoryTitle = routearg['title'];
      final CatagoryID = routearg['ID'];
      displayedMeal = widget.AvailableMeal.where(((meal) {
        return meal.catagories.contains(CatagoryID);
      })).toList();
      IsLoaded = true;
    }
    super.didChangeDependencies();
  }

  void RemoveItems(String mealid) {
    setState(() {
      displayedMeal.removeWhere((food) => mealid == food.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CatagoryTitle),
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return SingleMealItem(
                id: displayedMeal[index].id,
                titleOfItems: displayedMeal[index].titleOfItems,
                ImageURL: displayedMeal[index].ImageURL,
                complexity: displayedMeal[index].comlexity,
                duration: displayedMeal[index].duration,
                affordobility: displayedMeal[index].affordable,
                removeItem: RemoveItems,
              );
            },
            itemCount: displayedMeal.length),
      ),
    );
  }
}
