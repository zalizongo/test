import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/produit.dart';
import 'package:shopfurniture/provider/produits.dart';
class Formulaire extends StatefulWidget {
  const Formulaire({ Key? key }) : super(key: key);
  static const routeName = '/form_edit';

  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _avatarController = TextEditingController();
  final _avatarFocusNode = FocusNode();
  final _form = GlobalKey<FormState >();
  var editProdut = Product(
    id: 'null',
    title: '',
   price: 0,
   descriptions: '',
   avatar: '',

  );
  @override
  void dispose() {
   _priceFocusNode.dispose();
   _descriptionFocusNode.dispose();
   _avatarController.dispose();
   _avatarFocusNode.removeListener(_uptadeavatar);
    super.dispose();
  }
  void _uptadeavatar(){
    if (!_avatarFocusNode.hasFocus) {
      if ((_avatarController.text.isEmpty || !_avatarController.text.startsWith('http') &&
      !_avatarController.text.startsWith('https')) ||
      (!_avatarController.text.endsWith('.png') &&
      !_avatarController.text.endsWith('.png') &&
      !_avatarController.text.endsWith('.jpeg'))
      ) {
        return ;
      }
      setState(() {
        
      });
    }
  }
  void _saveForm(){
    final isValid =_form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<ProduitsProvider>(context,listen: false).addProduit(editProdut);
    Navigator.of(context).pop();
  
  }
  @override
  void initState() {
    _avatarFocusNode.addListener(_uptadeavatar);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produc'),
        actions: [
          IconButton(onPressed: _saveForm, icon: const Icon(Icons.save))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              validator: (value){
             if (value!.isEmpty) {
               return 'please correcte the title';
             }
             return null;
              },
              onSaved: (value){
                  editProdut = Product(
                    title: value.toString(),
                    price: editProdut.price,
                    descriptions: editProdut.descriptions,
                    avatar: editProdut.avatar,
                    id: null.toString() ,
                  );
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode:_priceFocusNode ,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              validator: (value){
                if (value!.isEmpty) {
                  return 'please enter the price';
                }
                if (double.tryParse(value) == null) {
                  return 'please enter a valide number';
                }
                if (double.parse(value)<= 0) {
                  return 'please enter a number greater than zero';
                }
                return null;
              },
              onSaved: (value){
                 editProdut = Product(
                    title: editProdut.title,
                    price: double.parse(value!),
                    descriptions: editProdut.descriptions,
                    avatar: editProdut.avatar,
                    id: null.toString() ,
                  );
              },

            ),
             TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              focusNode:_descriptionFocusNode ,
              validator: (value){
                if (value! .isEmpty) {
                  return 'pleace enter a descriptions';
                }
                if (value.length < 10) {
                  return 'should be at last 10 characters long.';
                }
                return null;
              },
              onSaved: (value){
                 editProdut = Product(
                    title: editProdut.title,
                    price: editProdut.price,
                    descriptions: value.toString(),
                    avatar: editProdut.avatar,
                    id: null.toString() ,
                  );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(top: 8,right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey
                    )
                  ),
                  child: _avatarController .text.isEmpty ?  const Text(' Enter a URL') 
                  : FittedBox(child: Image.network(_avatarController.text),fit: BoxFit.cover,)
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Image URL'
                    ),
                    keyboardType:TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller:_avatarController ,
                    focusNode: _avatarFocusNode,
                   onFieldSubmitted: (_){
                     _saveForm();
                   },
                   validator: (value){
                     if (value!.isEmpty) {
                       return 'please enter an image URL';
                     }
                     if (!value.startsWith('http') && !value.startsWith('https')) {
                       return 'please enter a valid URL' ;
                     }
                     if (!value.endsWith('.png')&& !value.endsWith('.jpg')&& !value.endsWith('.jpeg')) {
                       return 'please enter a valid iamge URL.';
                       
                     }
                     return null;
                   },
                   onSaved: (value){
                      editProdut = Product(
                    title: editProdut.title,
                    price: editProdut.price,
                    descriptions: editProdut.descriptions,
                    avatar: value.toString(),
                    id: null.toString() ,
                  );
                   },
                  ),
                ) 
              ],
            )
          ],
        )),
        )
    );
  }
}