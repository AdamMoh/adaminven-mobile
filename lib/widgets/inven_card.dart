// ignore_for_file: unused_import, use_key_in_widget_constructors, use_build_context_synchronously, unnecessary_string_interpolations

import 'package:adaminven/screen/list_item.dart';
import 'package:adaminven/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:adaminven/screen/addItem_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class InvenItem {
  final String name;
  final IconData icon;
  final Color color;

  InvenItem(this.name, this.icon, this.color);
}

class InvenCard extends StatelessWidget {
  final InvenItem item;

  const InvenCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Responsive touch area
        onTap: () async {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemFormPage()));
          } else if (item.name == "View Products") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.amber,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.amber),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
