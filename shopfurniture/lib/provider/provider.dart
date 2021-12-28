
import 'package:flutter/material.dart';
import 'package:shopfurniture/models/model.dart';
class ProviderAccueil with ChangeNotifier  {
  final List<Model >_categoris =[
    Model(
      id: 1,
      name: 'Dress',
      imageurl: 'images/1.jpeg', 
      color: Colors.lightBlueAccent,
      ),
       Model(
      id: 2,
      name: 'Skirt',
      imageurl: 'images/2.jpeg', 
      color: Colors.orangeAccent
      ),
       Model(
      id: 3,
      name: 'Hat',
      imageurl: 'images/3.jpeg', 
      color: Colors.pinkAccent
      ),
       Model(
      id: 4,
      name: 'Jeans',
      imageurl: 'images/4.jpeg', 
      color: Colors.blueAccent
      ),
       Model(
      id: 5,
      name: 'High',
      imageurl: 'images/5.jpeg', 
      color: Colors.black12
      ),
       
    
  ];
   List<Model> get categoris=>[..._categoris];
}
