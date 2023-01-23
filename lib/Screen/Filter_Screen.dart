// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_field, prefer_final_fields, prefer_const_constructors_in_immutables, non_constant_identifier_names, void_checks

import 'package:flutter/material.dart';
import 'package:swigito/Widgets/Main_Drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveitem;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.saveitem);

  static const routearg = 'filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree = false;
  bool _vegitarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  void initState() {
    _glutenfree = widget.currentFilter['gluten'] ?? false;
    _lactosefree = widget.currentFilter['lactose'] ?? false;
    _vegan = widget.currentFilter['vegan'] ?? false;
    _vegitarian = widget.currentFilter['vegetarian'] ?? false;
    super.initState();
  }

  Widget buildswitch(
    String text,
    bool currentvalue,
    Function changedvalue,
  ) {
    return SwitchListTile(
      value: currentvalue,
      onChanged: changedvalue,
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Filters'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilter = {
                    'gluten': _glutenfree,
                    'lactose': _lactosefree,
                    'vegan': _vegan,
                    'vegeterian': _vegitarian,
                  };
                  widget.saveitem(selectedFilter);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection'),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildswitch(
                  'GlutenFree',
                  _glutenfree,
                  ((value) {
                    setState(() {
                      _glutenfree = value;
                    });
                  }),
                ),
                buildswitch(
                  'LactoseFree',
                  _lactosefree,
                  ((value) {
                    setState(() {
                      _lactosefree = value;
                    });
                  }),
                ),
                buildswitch(
                  'Vegan',
                  _vegan,
                  ((value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                ),
                buildswitch(
                  'Vegetarian',
                  _vegitarian,
                  ((value) {
                    setState(() {
                      _vegitarian = value;
                    });
                  }),
                )
              ],
            ))
          ],
        ));
  }
}
