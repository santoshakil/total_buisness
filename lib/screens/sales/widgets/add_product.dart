import 'package:flutter/material.dart';

Widget addProduct() {
  return AlertDialog(
    elevation: 1.0,
    backgroundColor: Colors.white,
    scrollable: true,
    title: Text('Add New Product'),
    content: Stack(
      children: [
        Text('Product Name'),
      ],
    ),
  );
}
