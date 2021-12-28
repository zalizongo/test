

import 'package:flutter/material.dart';
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String descriptions;
  final double price;
  final String avatar;
  //final String etoils;
  //final Color color;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.descriptions,
    required this.price,
    required this.avatar,
   // required this.etoils,
    //required this.color,
    this.isFavorite = false,
  });

}
