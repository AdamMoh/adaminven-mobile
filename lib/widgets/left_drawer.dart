// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:adaminven/screen/menu.dart';
import 'package:adaminven/screen/addItem_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color of the Drawer
        ),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Text(
                    'Adam Inventory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Adam Inventory",
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              tileColor: Colors.black, // Set the background color of ListTile
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.amber,
              ),
              title: const Text(
                'Home Page',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.black, // Set the background color of ListTile
              leading: const Icon(
                Icons.add_shopping_cart,
                color: Colors.amber,
              ),
              title: const Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemFormPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
