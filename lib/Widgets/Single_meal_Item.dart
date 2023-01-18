// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, missing_return

import 'package:swigito/Models/Meal.dart';
import 'package:swigito/Screen/Meal_Detailes_Screen.dart';

import 'package:flutter/material.dart';

class SingleMealItem extends StatelessWidget {
  final String id;
  final String titleOfItems;
  final String ImageURL;
  final int duration;
  final Complexity complexity;
  final Affordobility affordobility;
  final Function removeItem;

  SingleMealItem({
    @required this.id,
    @required this.titleOfItems,
    @required this.ImageURL,
    @required this.duration,
    @required this.complexity,
    @required this.affordobility,
    @required this.removeItem,
  });
  void SelectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routearg, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Difficult:
        return 'Difficult';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get AffordobilityText {
    switch (affordobility) {
      case Affordobility.Affordable:
        return 'Affordable';
        break;
      case Affordobility.Pricey:
        return 'Pricey';
        break;
      case Affordobility.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    ImageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      titleOfItems,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(ComplexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(AffordobilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
