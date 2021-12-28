
import 'package:flutter/material.dart';
import 'package:shopfurniture/screen/oderscrre.dart';
import 'package:shopfurniture/screen/userproduct.dart';
class AppDrawer extends StatelessWidget {
  static const RouteName = ('/d');
  const AppDrawer({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('HELLO FRIND'),),
            const Divider(),
            ListTile(
              onTap: (){
               Navigator.of(context).pushReplacementNamed('/');
              },
              leading: const Icon(Icons.shop),
              title: const Text('Shop'),
            ),
            const Divider(),
            ListTile(
              onTap: (){
               Navigator.of(context).pushReplacementNamed(OrderScreen.routName);
              },
              leading: const Icon(Icons.payment),
              title: const Text('Payement'),
            ),
             const Divider(),
            ListTile(
              onTap: (){
               Navigator.of(context).pushReplacementNamed(UQserProductScrenn.routeName);
              },
              leading: const Icon(Icons.edit),
              title: const Text('Manage produts'),
            )
        ],
      ),
    );
  }
}