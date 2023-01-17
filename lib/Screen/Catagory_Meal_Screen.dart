// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, missing_return, unused_import, duplicate_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swigito/Models/Meal.dart';
import 'package:swigito/Widgets/Single_meal_Item.dart';
import 'package:swigito/Widgets/catagory_item.dart';
import 'Catagories_Screen.dart';
import '../Extra_Styling/Meal_List.dart';
import '../Models/Meal.dart';

class MyCatagoryMealScreen extends StatelessWidget {
  // final String CatagoryID;
  // final String CatagoryTitle;

  // MyCatagoryMealScreen(
  //   this.CatagoryID,
  //   this.CatagoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CatagoryTitle = routearg['title'];
    final CatagoryID = routearg['ID'];
    final catagoryItemList = DUMMY_MEALS.where(((meal) {
      return meal.catagories.contains(CatagoryID);
    })).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(CatagoryTitle),
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return SingleMealItem(
                id: catagoryItemList[index].id,
                titleOfItems: catagoryItemList[index].titleOfItems,
                ImageURL: catagoryItemList[index].ImageURL,
                complexity: catagoryItemList[index].comlexity,
                duration: catagoryItemList[index].duration,
                affordobility: catagoryItemList[index].affordable,
              );
            },
            itemCount: catagoryItemList.length),
      ),
    );
  }
}
