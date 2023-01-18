// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';

import 'package:swigito/Extra_Styling/dummy_data.dart';

import '../catagory_item.dart';

class CatagoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map((Answer) => Catagory_Item(Answer.ID, Answer.Title, Answer.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
