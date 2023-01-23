// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, duplicate_import, unused_field, prefer_final_fields, non_constant_identifier_names, avoid_types_as_parameter_names, missing_return, constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:swigito/Extra_Styling/Meal_List.dart';
import 'package:swigito/Models/Meal.dart';
import 'package:swigito/Screen/Meal_Detailes_Screen.dart';
import 'Screen/Catagories_Screen.dart';
import 'Screen/Catagory_Meal_Screen.dart';
import 'Screen/Tab_Screen.dart';
import './Screen/Filter_Screen.dart';
import './Extra_Styling/Meal_List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static const Routename = 'Catagories-Meal';

  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> availableMeal = DUMMY_MEALS;

  void _Setfilter(Map<String, bool> setfilter) {
    setState(() {
      _filter = setfilter;

      availableMeal = DUMMY_MEALS.where((Meal) {
        if (_filter['gluten'] == true && !Meal.isGlutenfree) {
          return false;
        }
        if (_filter['lactose'] == true && !Meal.isLactosefree) {
          return false;
        }
        if (_filter['vegan'] == true && !Meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] == true && !Meal.isVegitarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 224, 229, 1),
      ),
      routes: {
        '/': (context) => TabScreen(),
        'Catagories-Meal': (ctx) => MyCatagoryMealScreen(availableMeal),
        'MealDetailsScreen': (ctx) => MealDetailsScreen(),
        FilterScreen.routearg: (ctx) => FilterScreen(_filter, _Setfilter),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute(builder: (context) => CatagoryWidget());
      },
    );
  }
}
