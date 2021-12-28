import 'package:flutter/foundation.dart';
import 'package:shopfurniture/provider/catprovider.dart';

class OderItem {
  final String id;
  final double amount;
  final List<CartItem> produits;
  final DateTime dateTime;
  OderItem(
      {
        required this.id,
        required this.amount,
        required this.produits,
        required this.dateTime});
}

class Oders with ChangeNotifier {
  final List<OderItem> _orders = [];
  List<OderItem> get order => [..._orders];
  void addOeder(List<CartItem> cartproduit, double total) {
    _orders.insert(
        0,
        OderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            produits: cartproduit));
    notifyListeners();
  }
}
