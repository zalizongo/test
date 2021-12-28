import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/catprovider.dart'show Cart;
import 'package:shopfurniture/provider/oderprovider.dart';
import 'package:shopfurniture/widgets/catitem.dart';
class CartSreen extends StatelessWidget {
  static const routName = '/cart';
  const CartSreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('cart screen'),),
      body:Column(
        children: <Widget> [
          Card(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text('Total',style: TextStyle(fontSize: 20,color: Colors.black),),
                const SizedBox(width: 10,),
                Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}'),
                backgroundColor: Theme.of(context).primaryColor 
                ),
                TextButton(onPressed: (){
                  Provider.of<Oders>(context,listen: false).addOeder(
                    cart.items.values.toList(), 
                   cart.totalAmount);
                   cart.clear();
                }, child: const Text('ORDOR NOW'))
            ],),
          ),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx,index)=>CartItem(
              cart.items.values.toList()[index].id,
               cart.items.keys.toList()[index],
              cart.items.values.toList()[index].price,
             cart.items.values.toList()[index].title,
             cart.items.values.toList()[index].quantity,
              ),
            ))
        ],
      ) ,
    );
  }
}




