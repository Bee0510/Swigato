// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, duplicate_import

import 'package:flutter/material.dart';
import 'package:swigito/Screen/Meal_Detailes_Screen.dart';
import 'Screen/Catagories_Screen.dart';
import 'Screen/Catagory_Meal_Screen.dart';
import 'Screen/Tab_Screen.dart';
import './Screen/Filter_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static const Routename = 'Catagories-Meal';
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
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       bodyText1: TextStyle(
        //         color: Color.fromRGBO(20, 51, 51, 1),
        //       ),
        //       bodyText2: TextStyle(
        //         color: Color.fromRGBO(20, 51, 51, 1),
        //       ),
        //       titleMedium: TextStyle(
        //         fontFamily: 'RobotoCondensed',
        //         fontSize: 30,
        //       ),
        //     ),
      ),
      routes: {
        '/': (context) => TabScreen(),
        'Catagories-Meal': (ctx) => MyCatagoryMealScreen(),
        'MealDetailsScreen': (ctx) => MealDetailsScreen(),
        FilterScreen.routearg: (ctx) => FilterScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute(builder: (context) => CatagoryWidget());
      },
    );
  }
}
