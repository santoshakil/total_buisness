import 'package:flutter/material.dart';

Widget addProduct() {
  return AlertDialog(
    insetPadding: EdgeInsets.all(16.0),
    elevation: 1.0,
    backgroundColor: Colors.white,
    title: Text('Add New Product'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'Product name'),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Quantity'),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Quantity Type'),
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Discription'),
        ),
      ],
    ),
    actions: [
      FlatButton.icon(
        label: Text('Add Product'),
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
    ],
  );
}
