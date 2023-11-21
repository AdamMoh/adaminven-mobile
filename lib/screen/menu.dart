import 'package:flutter/material.dart';
import 'package:adaminven/widgets/left_drawer.dart';
import 'package:adaminven/widgets/inven_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<InvenItem> items = [
    InvenItem("View Products", Icons.checklist, Colors.black),
    InvenItem("Add Product", Icons.add_shopping_cart, Colors.black),
    InvenItem("Logout", Icons.logout, Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adam Inventory',
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Adam Inventory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber, // Set text color to gold
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InvenItem item) {
                  return Card(
                    color: Colors.black, // Set card background color to black
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5.0,
                    child: InvenCard(item),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
