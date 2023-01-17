// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:swigito/Extra_Styling/dummy_data.dart';

import 'Screen/Catagory_Meal_Screen.dart';

class Catagory_Item extends StatelessWidget {
  final String ID;
  final String title;
  final Color color;
  Catagory_Item(this.ID, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'Catagories-Meal', arguments: {
          'ID': ID,
          'title': title,
        });
      },
      splashColor: Colors.amber[400],
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(Color.getAlphaFromOpacity(0.7)),
                  color,
                ]),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
