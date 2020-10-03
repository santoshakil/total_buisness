import 'package:total_buisness/screens/sales/widgets/add_product.dart';
import 'package:total_buisness/screens/sales/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '       Sales',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Product'),
              onPressed: () {
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (BuildContext contex) {
                    return addProduct();
                  },
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                searchBarSales(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
