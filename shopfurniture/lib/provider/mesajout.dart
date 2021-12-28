import 'package:flutter/foundation.dart';

class Pr with ChangeNotifier {
  final String id;
  final String title;
  //final String descriptions;
  final double price;
  final String images;
  //final String etoils;
  //final Color color;
 // bool isFavorite;
  Pr({
    required this.id,
    required this.title,
    //required this.descriptions,
    required this.price,
    required this.images,
    //required this.etoils,
    //required this.color,
    //this.isFavorite = false,
   // required this.color, 
  });

}
