
import 'package:flutter/material.dart';
import 'package:shopfurniture/provider/mesajout.dart';
class Add with ChangeNotifier {
  final List<Pr> _items = [
    Pr(
      id: '1', 
      title: 'Cute Knitted dress', 
      price: 20.00,
      images: 'images/9.jpeg', 
      ),
       Pr(
      id: '2', 
      title: 'Cute Knitted dress', 
      price: 20.00,
      images: 'images/9.jpeg', 
      ),
       Pr(
      id: '3', 
      title: 'Cute Knitted dress', 
      price: 20.00,
      images: 'images/9.jpeg', 
      ),
       Pr(
      id: '4', 
      title: 'Cute Knitted dress', 
      price: 20.00,
      images: 'images/9.jpeg', 
      ),
       Pr(
      id: '5', 
      title: 'Cute Knitted dress', 
      price: 20.00,
      images: 'images/9.jpeg', 
      ),
  ];
   List<Pr> get items => [..._items ];
}
