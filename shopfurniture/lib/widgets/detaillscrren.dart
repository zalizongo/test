
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/a.dart';
import 'package:shopfurniture/provider/catprovider.dart';

import 'package:shopfurniture/provider/produits.dart';
import 'package:shopfurniture/screen/catscrre.dart';
class Detaileproduts extends StatefulWidget {
  const Detaileproduts({ Key? key }) : super(key: key);
   static const RouteName = ('/detailsreen');
  @override
  State<Detaileproduts> createState() => _DetaileprodutsState();
}

class _DetaileprodutsState extends State<Detaileproduts> {
  int currenslect = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final choix = Provider.of<Lesdifferentetaiile>(context).choix;
    final produt = Provider.of<ProduitsProvider>(context).items;
    var renseig = ModalRoute.of(context)!.settings.arguments as String;
    var hot = produt.firstWhere((element) => element.id == renseig);
    return Scaffold(
      body: Container(
       // color: Colors.red,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Stack(
             children: [
               Container(
             margin: const EdgeInsets.only(left: 10,right: 10,top: 30),
              height: MediaQuery.of(context).size.height/2,
              //color: Colors.black,
              decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage(hot.avatar),
                fit: BoxFit.cover
                ),
                color: Colors.pinkAccent,
                borderRadius:  const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              ),
           ),
           Align(
             alignment: Alignment.topLeft,
             child: Container(
               padding: const EdgeInsets.all(10),
               margin: const EdgeInsets.only(top: 10,),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   IconButton(onPressed: (){
                   Navigator.pushNamed(context, '/d');
                   }, icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.messenger,size: 30,color: Colors.black,)),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: IconButton(onPressed: (){
                             Navigator.of(context).pushNamed(CartSreen.routName);
                          }, icon: const Icon(Icons.shopping_bag,size: 30,color: Colors.black,))),
                      ],
                    )
                 ],
               ),
               height:MediaQuery.of(context).size.height/7, 
             ),
           )
             ],
           ),
           const SizedBox(height: 20,),
           Container(
             margin: const EdgeInsets.only(left: 20),
             child: Text(hot.descriptions,style: const TextStyle(fontSize: 30,fontWeight:FontWeight.bold ),),
           ),
           const SizedBox(height: 5,),
           Container(
             margin: const EdgeInsets.only(left: 20),
             child: Row(children: [
               const Icon(Icons.star,size: 30,color: Colors.black,),
                const SizedBox(width: 5,),
               Text(hot.id,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
               const SizedBox(width: 5,),
               const Text('Rating',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey ),),
               const SizedBox(width: 80,),
               IconButton(onPressed: (){}, icon: const Icon(Icons.messenger,size: 30,color: Colors.black,)),
               const Text('43',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black ),),
               TextButton(onPressed: (){}, child: const Text('Reviews',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey ),))
             ],),
           ),
           const SizedBox(height: 20,),
           Container(
             margin: EdgeInsets.only(left: 5),
             child: Row(
               children: [
                 const Text('Choose Size :',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black ),),
                 //SizedBox(width: 10,),
                 Container(
                   height: 50,
                   child: ListView.builder(
                     shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                     itemCount:choix.length ,
                     itemBuilder: (context,index)=>Row(
                       children: [
                         Container(
                          height: 50,
                          width: 50,
                          margin:const EdgeInsets.only(left: 1,right: 1) ,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                currenslect = index;
                              });
                            },
                            child: Card(
                              color: index==currenslect? Colors.black.withOpacity(0.7):Colors.grey,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              elevation: 3,
                              child: Center(child: Text(choix[index].taille,style: const TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20 ),)),
                            ),
                          ),
                          ),
                       ],
                     )),
                 )
               ],
             ),
           ),
           Container(
             margin: const EdgeInsets.only(left: 10,right: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: const [
                 Text('hello'),
                 Text('hello'),
               ],
             ),
           ),
           SizedBox(height: 10,),
            Container(
             margin: const EdgeInsets.only(left: 10,right: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: const [
                 Text('hello'),
                 Text('helle'),
               ],
             ),
           ),
           const SizedBox(height: 10,),
           Container(
            // padding: const EdgeInsets.all(20),
             margin: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
             child: Row(
        children: [
           IconButton(onPressed: (){}, icon: const Icon(Icons.messenger_rounded,size: 30,color: Colors.black,)),
               const Text('Chats',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.black ),),
               const SizedBox(width:38,),
               Container(
                 child: Center(child: Row(
                   children: [
                     IconButton(onPressed: (
                     ){
                       cart.addItem(
                            hot.id, 
                            hot.price, 
                            hot.title);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text('vous_avez ajouter un article dans le panier'),
                            duration:const Duration(seconds: 2) ,
                            action: SnackBarAction(label: 'Annuler', onPressed: (){
                              cart.removeSigleItem(hot.id);
                            }),
                            ));
                     }, icon: const Icon(Icons.shopping_bag,size: 30,color: Colors.white,)),
                     const Text('Add to bag',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white ),),
                   ],
                 )
                 ),
                 height:80 ,
                 width: 200,
                 decoration: const BoxDecoration(
                   color: Colors.black,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                   topRight:  Radius.circular(20)
                   )
                 ),
               ),
             ],
             )
           ),
          // const Monajout(),
         ],
        ),
      ) 
    );
  }
}