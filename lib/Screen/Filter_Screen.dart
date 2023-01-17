// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:swigito/Widgets/Main_Drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routearg = 'filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filter!'),
      ),
    );
  }
}
