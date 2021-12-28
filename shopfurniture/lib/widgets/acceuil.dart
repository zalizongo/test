import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/provider.dart';
import 'package:shopfurniture/widgets/gridproduit.dart';
import 'package:shopfurniture/widgets/stack.dart';
class Accueil extends StatelessWidget {
  const Accueil({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final produit = Provider.of<ProviderAccueil>(context).categoris;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
         padding: const EdgeInsets.only(top: 60),
         margin: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.black,size: 25,)),
                const Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.messenger_outline,color: Colors.black,size: 25,)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.messenger_outline,color: Colors.black,size: 25,)),
              ],),
              const SizedBox(height: 20,),
              Container(
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    child: const Icon(Icons.search,size: 35,)),
                  const Text('Search products',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),)
                ],),
               // padding: const EdgeInsets.all(50),
                height: 60,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
             SizedBox(height: 25,),
              Container(
                height: 130,
              // color: Colors.red,
               // width: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                  itemCount:produit.length ,
                  itemBuilder:(context,index)=>Column(
                    children: [
                      Row(
                        children: [
                         Container(
                           margin: const EdgeInsets.only(left: 10,),
                           child:  CircleAvatar(
                            // child:Image.asset(produit[index].imageurl),
                             //backgroundColor: Colors.black,
                             radius: 40,
                             backgroundImage: AssetImage(produit[index].imageurl),
                           ),
                         )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(produit[index].name,style: const TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
                          )
                        ],
                      ),
                    ],
                  )
                  ),
              ),
              const SizedBox(height: 10,),
             Container(
               height: 200,
               child: const Hello(),
             ),
             Container(
               padding: const EdgeInsets.only(bottom: 80),
              // margin: const EdgeInsets.only(top: 50),
             //  color: Colors.red,
               height: 400,
               child:const GriProducts() ,
             )
            ],
          )
          ),
          
      )
      ,
      bottomNavigationBar:Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
           IconButton(onPressed: (){}, icon: const Icon(Icons.home,size: 40,color: Colors.green,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag,size: 40,color: Colors.black,)),
             IconButton(onPressed: (){}, icon: const Icon(Icons.person,size: 40,color: Colors.black,))
          ],
        ),
      )
      
    );
  }
}
