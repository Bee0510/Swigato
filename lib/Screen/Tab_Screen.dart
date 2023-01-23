// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, equal_keys_in_map, duplicate_import, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:swigito/Models/Meal.dart';
import 'package:swigito/Widgets/Main_Drawer.dart';
import '../Widgets/Main_Drawer.dart';
import 'Catagories_Screen.dart';
import 'Catagory_Meal_Screen.dart';
import 'MyFavorite_Screen.dart';
import '../Extra_Styling/Meal_List.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> MyFavoriteMeal;
  TabScreen(this.MyFavoriteMeal);

  @override
  State<TabScreen> createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> Page = [];

  @override
  void initState() {
    Page = [
      {
        'page': CatagoryWidget(),
        'title': 'Catagories',
      },
      {
        'page': MyFavoriteScreen(widget.MyFavoriteMeal),
        'title': 'MyFav',
      }
    ];
    super.initState();
  }

  int SelectPageNumber = 0;

  void SelectPageJump(int index) {
    setState(() {
      SelectPageNumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Page[SelectPageNumber]['title']),
        // bottom: TabBar(tabs: <Widget>[
        //   Tab(icon: Icon(Icons.food_bank), text: 'Catagories'),
        //   Tab(icon: Icon(Icons.favorite), text: 'Fvaorites'),
        // ]),
      ),
      drawer: MainDrawer(),
      // body: TabBarView(children: <Widget>[
      //   CatagoryWidget(),
      //   MyFavoriteScreen(),
      // ]),
      body: Page[SelectPageNumber]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: SelectPageJump,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          selectedItemColor: Colors.yellow,
          currentIndex: SelectPageNumber,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category_sharp),
              label: 'Catagory',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            )
          ]),
    );
  }
}
