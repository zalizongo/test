import 'package:flutter/material.dart';
import 'package:shopfurniture/provider/oderprovider.dart'as ord;
import 'package:intl/intl.dart';
import 'dart:math';
class OrderItem extends StatefulWidget {
  final ord.OderItem order;
   const OrderItem( this.order, {Key? key}) : super(key: key) ;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
   var  _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(title: Text('\$${widget.order.amount}'),
          subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
           trailing: IconButton(icon: Icon(_expanded? Icons.expand_less:Icons.expand_more), onPressed: (){
              setState(() {
                _expanded = !_expanded;
              });
            }),
          ),
           if( _expanded)Container(
             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
             height: min(widget.order.produits.length *20.0 + 10,100),
             child: ListView(children: widget.order.produits.map((prod) => Row(
              children:<Widget> [
                Text(prod.title,style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text('${prod.quantity}x  \$${prod.price}',style: const TextStyle(
                  fontSize: 18,
                  fontWeight:  FontWeight.bold,
                  color: Colors.grey
                ),)

              ],
            )).toList()),

           ),
        ],
      ),
    );
  }
}