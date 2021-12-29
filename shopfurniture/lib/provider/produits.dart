
import 'package:flutter/material.dart';
import 'package:shopfurniture/provider/produit.dart';
class ProduitsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '1', 
      title: 'Cute Knitted dress', 
      descriptions: 'Blue and Brown Floral top ',
      price: 20.00,
      avatar:'images/9.jpeg' ,
       //etoils: '5.5',
      //color: Colors.tealAccent
      ),
       Product(
      id: '2', 
      title: 'Cute Knitted dress', 
      descriptions: 'Blue and Brown Floral top ',
      price: 50.00,
      avatar: 'images/9.jpeg', 
      // etoils: '8.5',
      //color: Colors.tealAccent
      ),
       Product(
      id: '3', 
      title: 'Cute Knitted dress', 
      descriptions: 'Blue and Brown Floral top ',
      price: 200.00,
      avatar: 'images/9.jpeg', 
      // etoils: '6.5',
      //color: Colors.tealAccent
      ),
       Product(
      id: '4', 
      title: 'Cute Knitted dress', 
      descriptions: 'Blue and Brown Floral top ',
      price: 40.00,
      avatar: 'images/9.jpeg', 
      // etoils: '4.5',
     // color: Colors.tealAccent
      ),
       Product(
      id: '5', 
      title: 'Cute Knitted dress', 
      descriptions: 'Blue and Brown Floral top ',
      price: 200,
      avatar: 'images/9.jpeg', 
       //etoils: '6.5',
      //color: Colors.tealAccent
      ),
  ];
   List<Product> get items => [..._items ];
  void addProduit(Product product){
    final newproduit = Product(
      title: product.title,
      descriptions: product.descriptions,
      price:product.price,
      avatar:  product.avatar,
      id: DateTime.now().toString() 
    );
    notifyListeners();
    _items.add(newproduit);
    _items.insert(0, newproduit);
  }
}