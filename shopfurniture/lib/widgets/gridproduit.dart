
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/produits.dart';
import 'package:shopfurniture/widgets/produittiti.dart';
class GriProducts extends StatelessWidget {
  const GriProducts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final produitData =  Provider.of<ProduitsProvider>(context);
    final product = produitData.items;
    return  Scaffold(
      body: Container(
        height: 500,
        //color: Colors.lightBlueAccent,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection:Axis.horizontal ,
          itemCount:product.length ,
          itemBuilder: (context,index)=>ChangeNotifierProvider.value(
                  value: product[index],
                child:  ProduitGri(),
              )
          ),
      ),
    );
  }
}