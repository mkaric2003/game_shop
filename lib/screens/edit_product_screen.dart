// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_shop/providers/product.dart';
import 'package:game_shop/providers/products.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = 'edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    imageUrl: '',
    description: '',
    price: 0,
    //isFavorite: false,
    //isBattleRoyal: false,
    //isStrategy: false,
    //isSports: false,
    //isHorror: false
  );

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          (!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit product'),
        actions: <Widget>[
          IconButton(onPressed: _saveForm, icon: Icon(Icons.save))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigo.withOpacity(0.5),
            //Colors.white.withOpacity(0.5),
            Colors.black.withOpacity(0.7),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 16.0, top: 25),
          child: Form(
              key: _form,
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Naziv',
                        labelStyle: TextStyle(color: Colors.white)),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Molimo unesite naziv.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedProduct = Product(
                        id: null,
                        title: value,
                        imageUrl: _editedProduct.imageUrl,
                        description: _editedProduct.description,
                        price: _editedProduct.price,
                        //isFavorite: false,
                        //isBattleRoyal: false,
                        //isStrategy: false,
                        //isSports: false,
                        //isHorror: false
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cijena',
                        labelStyle: TextStyle(color: Colors.white)),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Molimo unesite cijenu. ';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Molimo unesite ispravan broj.';
                      }
                      if (double.parse(value) <= 0) {
                        return 'Molimo unesite broj veći od nule.';
                      }
                      ////////////////////////////////////////////////////////
                    },
                    onSaved: (value) {
                      _editedProduct = Product(
                        id: null,
                        title: _editedProduct.title,
                        imageUrl: _editedProduct.imageUrl,
                        description: _editedProduct.description,
                        price: double.parse(value!),
                        //isFavorite: false,
                        //isBattleRoyal: false,
                        //isStrategy: false,
                        //isSports: false,
                        //isHorror: false
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Opis',
                        labelStyle: TextStyle(color: Colors.white)),
                    maxLines: 5,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    focusNode: _descriptionFocusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Molimo unesite opis.';
                      }
                      if (value.length < 10) {
                        return 'Opis mora sadržavati najmanje deset znakova';
                      }
                      ///////////////////////////////////////////////
                    },
                    onSaved: (value) {
                      _editedProduct = Product(
                        id: null,
                        title: _editedProduct.title,
                        imageUrl: _editedProduct.imageUrl,
                        description: value,
                        price: _editedProduct.price,
                        //isFavorite: false,
                        //isBattleRoyal: false,
                        //isStrategy: false,
                        //isSports: false,
                        //isHorror: false
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'URL adresa slike',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Molimo unesite URL slike';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Molimo unesite validnu URL adresu slike';
                          }
                          if (!value.endsWith('.png') &&
                              !value.endsWith('.jpg') &&
                              !value.endsWith('.jpeg')) {
                            return 'Molimo unesite validnu URL adresu slike';
                          }
                          //////////////////////////////////////////////////////
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: null,
                              title: _editedProduct.title,
                              imageUrl: value,
                              description: _editedProduct.description,
                              price: _editedProduct.price
                              //isFavorite: false,
                              //isBattleRoyal: false,
                              //isStrategy: false,
                              //isSports: false,
                              //isHorror: false
                              );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        height: 210,
                        margin: EdgeInsets.only(top: 8, right: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.black26)),
                        child: _imageUrlController.text.isEmpty
                            ? Center(child: Text('Unesite URL adresu'))
                            : FittedBox(
                                child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
