
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/produits.dart';
import 'package:shopfurniture/screen/editscreen.dart';
import 'package:shopfurniture/widgets/appdrawer.dart';
import 'package:shopfurniture/widgets/userproduit.dart';
class UQserProductScrenn extends StatelessWidget {
  const UQserProductScrenn({ Key? key }) : super(key: key);
  static const routeName = '/userproduts';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProduitsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('les produits'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: (const Icon(Icons.add)))
        ],
      ),
      drawer:const AppDrawer() ,
      body:Padding(
        padding:const EdgeInsets.all(8) ,
        child: ListView.builder(
          itemCount:productData.items.length ,
          itemBuilder: (_,i)=>Column(
            children: [
              UserProdutItem(productData.items[i].title,productData.items[i].avatar,
              ) ,
              const Divider(),
            ],
          ),
          
          ),
        ),

    );
  }
}