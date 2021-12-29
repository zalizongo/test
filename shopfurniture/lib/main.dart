import 'package:flutter/material.dart';
import 'package:shopfurniture/provider/a.dart';
import 'package:shopfurniture/provider/ajout.dart';
import 'package:shopfurniture/provider/catprovider.dart';
import 'package:shopfurniture/provider/oderprovider.dart';
import 'package:shopfurniture/provider/produits.dart';
import 'package:shopfurniture/provider/provider.dart';
import 'package:shopfurniture/screen/catscrre.dart';
import 'package:shopfurniture/screen/editscreen.dart';
import 'package:shopfurniture/screen/formulaire.dart';
import 'package:shopfurniture/screen/oderscrre.dart';
import 'package:shopfurniture/screen/screen.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/screen/userproduct.dart';
import 'package:shopfurniture/widgets/appdrawer.dart';
import 'package:shopfurniture/widgets/detaillscrren.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderAccueil()),
        ChangeNotifierProvider(create: (_) => ProduitsProvider()),
        ChangeNotifierProvider(create: (_) => Lesdifferentetaiile()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Oders()),
        ChangeNotifierProvider(create: (_) =>Add ()),
  ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),  
       // home: const MyHomePage(),
        initialRoute:'/' ,
        routes: {
          '/':(context)=> const MyHomePage(),
          '/detailsreen':(context)=>const  Detaileproduts(),
          '/d':(context)=>const AppDrawer(),
           CartSreen.routName:(ctx)=>const CartSreen(),
           OrderScreen.routName:(ctx)=>const OrderScreen (),
           UQserProductScrenn.routeName:(ctx)=>const UQserProductScrenn (),
           EditProductScreen.routeName:(ctx)=> const EditProductScreen(),
           Formulaire.routeName:(ctx)=> const Formulaire(),
          
        },
        debugShowCheckedModeBanner: false
      ),
    );
  }
}

