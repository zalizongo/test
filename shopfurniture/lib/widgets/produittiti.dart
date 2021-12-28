

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/produit.dart';
class ProduitGri extends StatelessWidget {
  const ProduitGri({ Key? key }) : super(key: key);
//static const RouteName = ('/retour');
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false );
     //final cart = Provider.of<Cart>(context);
    return InkWell(
      onTap: (){
       Navigator.pushNamed(context, '/detailsreen',arguments:product.id );
      },
      child: Stack(
        children: [
          Row(
            children: [
              Column(children: [
                Container(
                margin: const EdgeInsets.only(left: 10),
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                      image: DecorationImage(image: AssetImage(product.avatar),
                      fit: BoxFit.cover,
                     // colorFilter: ColorFilter.linearToSrgbGamma()
                      )
                    ),
              ),
              Container(
                child: Row(
                  children:  [
                    const Text('\$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text(product.price.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 40,),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.red,size: 20,))
                  ],
                ),
              ),

              ],)
            ],
          )
        ],
      )
       
    );
  }
}