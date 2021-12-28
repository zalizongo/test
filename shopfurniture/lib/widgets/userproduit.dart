
import 'package:flutter/material.dart';
class UserProdutItem extends StatelessWidget  {
  final String title;
  final String avatar;
   UserProdutItem(this.title,this.avatar);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: AssetImage(avatar),),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit),color: Theme.of(context).primaryColor,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.delete),color: Theme.of(context).errorColor,)
          ],
        ),
      ),
    );
  }
  
}