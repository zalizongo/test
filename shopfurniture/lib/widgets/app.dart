

import 'package:flutter/material.dart';
class A extends StatelessWidget {
  const A({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
           height:80 ,
                 width: 200,
                 decoration: const BoxDecoration(
                   color: Colors.black,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                   topRight:  Radius.circular(20)
                   )
                 ),
            child: Center(child: Row(
                   children: [
                     IconButton(onPressed: (
                     ){
                     }, icon: const Icon(Icons.shopping_bag,size: 30,color: Colors.white,)),
                     const Text('Add to bag',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white ),),
                   ],
                 )
                 ),
          ),
    );
  }
}
