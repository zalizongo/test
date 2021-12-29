
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopfurniture/provider/produit.dart';
import 'package:shopfurniture/provider/produits.dart';
class EditProductScreen extends StatefulWidget {
  const EditProductScreen({ Key? key }) : super(key: key);
  static const routeName = '/edit-produts';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}
class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocunode = FocusNode();
  final _descriptionFocunode = FocusNode();
  final _imageurlController = TextEditingController();
  final _imagaFocunode =  FocusNode();
  final _form  = GlobalKey<FormState>();
   var  _editdProduct = Product (
    id: 'null',
     title:'' ,
      price: 0,
      descriptions: '',
       avatar: '',  ) ;
  @override
  void initState() {
    _imagaFocunode.addListener(_updadeimageurl);
    super.initState();
  }
  @override
  void dispose() {
     _imagaFocunode.removeListener(_updadeimageurl);
    _priceFocunode .dispose();
    _descriptionFocunode.dispose();
    _imageurlController.dispose();
    _imagaFocunode.dispose();
    super.dispose();
  }
  void _updadeimageurl(){
    if (!_imagaFocunode.hasFocus) {
      if (_imageurlController.text.isEmpty||
      (!_imageurlController.text.startsWith('https') && 
       !_imageurlController.text.startsWith('https'))
       ||  !_imageurlController.text.endsWith('.png')
       && !_imageurlController.text.endsWith('.jpg')
       && !_imageurlController.text.endsWith('.jpeg')) {
         return;
        
      }
      setState(() {
      });
      
    }
  }
  void _saveForm(){
   final isvalide =_form.currentState!.validate();
   if (isvalide) {
     return;
   }
    _form.currentState!.save();
   // Provider.of(context)<ProduitsProvider>(context,listen:false).; 
   //Provider.of<ProduitsProvider>(context,listen: false).addproduit( _editdProduct);
   Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Edit Produts'),
        actions: [
        IconButton(onPressed: (){
           //_saveForm();
        }, icon: const Icon(Icons.save))
        ],

        ),
      body: Form(
        key: _form,
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: ListView(children: <Widget>[
            TextFormField(decoration: const InputDecoration(
              labelText: 'Tilte',
              //errorStyle: TextStyle(color: Colors.red),
              labelStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.indigo)
            ),
            cursorColor: Colors.indigo,
            textInputAction: TextInputAction.next,
            keyboardType:TextInputType.text ,
            focusNode: _priceFocunode,
            onFieldSubmitted: (_){
              FocusScope.of(context).requestFocus(_priceFocunode );
            },
            validator: (value){
             if (value!.isEmpty) {
               return 'please provide a value';
             }
             return null;
            },
            onSaved: (value){
              _editdProduct = Product (
                title: value.toString(),
                price: _editdProduct.price,
                descriptions: _editdProduct.descriptions,
                avatar: _editdProduct.avatar,
                id: null.toString(),
              );
            },

            ),
            const SizedBox(height: 10,),
            TextFormField(decoration: const InputDecoration(
              labelText: 'Price',
              labelStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.indigo)
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode:_priceFocunode ,
            validator: (value){
              if (value!.isEmpty) {
                return 'please enter the price';
              }
              if (double.tryParse(value)==null) {
                return 'Please enter ac valid number';
              }
              if (double.tryParse(value)!<=0) {
                return 'Please enter a number';
              }
              return null;
            },
            onSaved: (value){
              _editdProduct = Product (
                title: _editdProduct.title,
                price: double.parse(value!),
                descriptions: _editdProduct.descriptions,
                avatar: _editdProduct.avatar,
                id: null.toString(),
              );
            },
            ),
             TextFormField(decoration: const InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.indigo)
            ),
            textInputAction: TextInputAction.next,
            keyboardType:TextInputType.multiline ,
            maxLines: 3,
            focusNode: _descriptionFocunode,
            onFieldSubmitted: (_){
              FocusScope.of(context).requestFocus(_descriptionFocunode );
            },
            validator: (value){
              if (value!.isEmpty) {
                return 'please enter a description';
              }
              if (value.length<10) {
                return 'should be at latest 10 caractere';
              }
              return null;
            },
             onSaved: (value){
              _editdProduct = Product (
                title: _editdProduct.title,
                price: double.parse(value!),
                descriptions: value,
                avatar: _editdProduct.avatar,
                id: null.toString(),
              );
            },
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(top: 8,right:10 ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey )
                ),
                child: _imageurlController.text.isEmpty ? const Center(child: Text('Entrer url correcte',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),)):FittedBox(child: Image.network(_imageurlController.text,fit: BoxFit.cover,),)
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'imageurl',
                    labelStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.indigo)
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  controller:_imageurlController ,
                  focusNode: _imagaFocunode,
                  onFieldSubmitted: (_){
                    _saveForm();
                  },
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'please enter url correcte';
                    }
                    if (!value.startsWith('http')&& !value.startsWith('https')) {
                      return 'plase enter URl valid';
                    }
                    if (!value.endsWith('.png')&& !value.endsWith('.jpg')&& !value.endsWith('jpeg')) {
                      return 'enter image valid';
                      
                    }
                    return null;
                  },
                  onSaved: (value){
              _editdProduct = Product (
                title: _editdProduct.title,
                price: double.parse(value!),
                descriptions: value,
                avatar: value,
                id: null.toString(),
              );
            },
                ),
              )
            ],
            ),
            const SizedBox(height: 20,),
        Container(
          height: 50,
          width: 50,
          child: TextButton(onPressed: _saveForm, child: const Text('valider')),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(20)
          ),
        )
          ],
          )
          ),
        )),
    ); 
  }
} 