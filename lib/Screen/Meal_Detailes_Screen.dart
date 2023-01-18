// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_string_interpolations, missing_return

import 'package:flutter/material.dart';
import '../Extra_Styling/Meal_List.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routearg = 'MealDetailsScreen';

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[700]),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final MealID = ModalRoute.of(context).settings.arguments as String;
    final SelectedMeal = DUMMY_MEALS.where(
      (meal) => meal.id == MealID,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${SelectedMeal.first.titleOfItems}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              height: 200,
              child: Image.network(
                SelectedMeal.first.ImageURL,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingrediants'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.amber[100],
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(SelectedMeal.first.ingrediant[index]),
                  ),
                ),
                itemCount: SelectedMeal.first.ingrediant.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(SelectedMeal.first.step[index]),
                    )),
                itemCount: SelectedMeal.first.step.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).pop(MealID);
        }),
        child: Icon(Icons.delete),
      ),
    );
  }
}
