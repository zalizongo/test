
import 'package:flutter/material.dart';
class Hello extends StatelessWidget {
  const Hello({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
               children: [
                 Container(
                   height: 180,
                   width: 400,
                   decoration: BoxDecoration(
                     image: const DecorationImage(image: AssetImage('images/7.jpeg'),
                     fit: BoxFit.cover
                     ),
                     color: Colors.tealAccent,
                     borderRadius:BorderRadius.circular(30) ),
                 ),
                 Align(
                   alignment: Alignment.topRight,
                   child:Container(
                     padding: const EdgeInsets.all(20),
                     margin: const EdgeInsets.only(top: 30,left: 25, ),
                     height:MediaQuery.of(context).size.height/7,
                     child: const Text('Zali collection',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.red ),),
                   )
                 ),
                 Align(
                   alignment: Alignment.bottomLeft,
                   child: Container(
                     padding: const EdgeInsets.all(20),
                     margin: const EdgeInsets.only(left: 10,right: 10,top: 40),
                    height: MediaQuery.of(context).size.height/3,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children:[
                         const Text('New',style:TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.red ) ,),
                          Row(
                            children:  [
                              const Text('Arrivages',style:TextStyle(fontSize: 30,fontWeight:FontWeight.bold ,color: Colors.red) ,),
                              Spacer(),
                            //TextButton(onPressed: (){}, child:const Text('Explore All',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),)),
                            ElevatedButton(
                              onPressed: (){}, 
                              child: const Text('Explore All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                            ], 
                          ),
                          
                       ],
                       
                     ),
                   ),
                 )
               ],
             ),
    );
  }
}