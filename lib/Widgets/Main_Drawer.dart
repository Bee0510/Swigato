// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import '../Screen/Filter_Screen.dart';
import '../Screen/Tab_Screen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildDrawerItems(String title, IconData icon, Function TapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: TapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          BuildDrawerItems('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildDrawerItems('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routearg);
          }),
        ],
      ),
    );
  }
}
