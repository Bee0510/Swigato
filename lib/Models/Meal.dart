// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unused_import
import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Difficult,
  Hard,
}

enum Affordobility {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> catagories;
  final String titleOfItems;
  final String ImageURL;
  final List<String> ingrediant;
  final List<String> step;
  final Complexity comlexity;
  final int duration;
  final Affordobility affordable;
  final bool isGlutenfree;
  final bool isVegan;
  final bool isLactosefree;
  final bool isVegitarian;

  Meal({
    this.id,
    this.catagories,
    this.titleOfItems,
    this.ImageURL,
    this.ingrediant,
    this.step,
    this.comlexity,
    this.duration,
    this.affordable,
    this.isGlutenfree,
    this.isLactosefree,
    this.isVegan,
    this.isVegitarian,
  });
}
