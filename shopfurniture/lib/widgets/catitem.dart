import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/catprovider.dart';
class CartItem extends StatelessWidget {
  final String id;
  final String productid;
  final double price;
   final int quantity;
  final String title;
     CartItem( 
       this.productid,
       this.id,
        this.price,
         this.title,
          this.quantity) ;

  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: ValueKey(id) ,
      background: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete,color: Colors.white,size: 40,),
        color:Theme.of(context).errorColor,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(context: context, builder: (ctx)=> AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('do you want to remove item the item from the cart?'
          ),
         actions: [
           TextButton(onPressed: (){
             Navigator.of(ctx).pop(false);
           }, child: const Text('NO')),
           TextButton(onPressed: (){ 
              Navigator.of(ctx).pop(true);
           }, child: const Text('Yes')),
         ],
        ),
        );
      },
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeItem(productid);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading:  CircleAvatar(child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(child: Text('\$$price'))),),
           title: Text(title),
           subtitle:  Text('Total: \$${price*quantity}'),
           trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}