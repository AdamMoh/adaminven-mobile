# adaminven - Mobile Version
## Flutter Assignment
### Assignment 7

<details>
<summary>1. What are the main differences between stateless and stateful widget in Flutter?</summary>

Stateless Widget: The widgets whose state can not be altered once they are built are called stateless widgets. These widgets are immutable once they are built.

Stateful Widget: The widgets whose state can be altered once they are built are called stateful Widgets. These states are mutable and can be changed multiple times in their lifetime.
</details>

<details>
<summary>2. Explain all widgets that you used in this assignment.</summary>

1. Scaffold – Implements the basic material design visual layout structure.
2. App-Bar – To create a bar at the top of the screen.
3. Text - To write anything on the screen.
4. Container – To contain any widget.
5. Center – To provide center alignment to other widgets.
6. Column - To displays its children in a vertical array
</details>

<details>
<summary>3. Explain how you implemented the checklist above step-by-step (not just following the tutorial)</summary>

1. Create flutter project:
```
flutter create adaminven
```

2. Change the directory to a new directory that created after execute flutter project command, and run the initial project
```
cd adaminven
flutter run
```

3. change `main.dart` to include `menu.dart`

```
import 'package:flutter/material.dart';
import 'package:adaminven/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adam Inventory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade200),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

```

and the `menu.dart` will be like this:
```
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<HomeProperies> items = [
    HomeProperies("View Products", Icons.checklist, Colors.amber),
    HomeProperies("Add Product", Icons.add_shopping_cart, Colors.black),
    HomeProperies("Logout", Icons.logout, Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Adam Inventory',
        ),
        backgroundColor: Colors.red.shade200,
      ),
      body: SingleChildScrollView(
        // Scrolling wrapper widget
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding for the page
          child: Column(
            // Widget to display children vertically
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Text widget to display text with center alignment and appropriate style
                child: Text(
                  'Adam Inventory', // Text indicating the shop name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container for our cards.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((HomeProperies item) {
                  // Iteration for each item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeProperies {
  final String name;
  final IconData icon;
  final Color btnColor;

  HomeProperies(this.name, this.icon, this.btnColor);
}

class ShopCard extends StatelessWidget {
  final HomeProperies item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.btnColor,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));
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
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```
</details>


### Assignment 8

<details>
<summary>1. Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!</summary>

Navigator.push() and Navigator.pushReplacement() are methods used for navigating between different screens or routes in flutter app.

1. **Navigator.push()**:
- This method is used to push a new route onto the navigator's stack, which results in displaying a new screen on top of the existing ones.
- It adds the new route to the stack, allowing users to navigate back to the previous screen using the back button or gesture.
- This is typically used to navigate to a new screen and allow users to navigate back to the
previous one.

example:
```
onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InvenFormPage()));
          }
        },
```

2. **Navigator.pushReplacement()**:
- This method is used to replace the current route with a new one. It removes the current route from the stack and adds the new one.

- The user won't be able to navigate back to the previous screen because it's replaced in the stack. This is useful to replace the current screen with a new one and don't want the user to go back to the previous screen.

example:
```
onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => NewScreen()),
  );
}
```
</details>


<details>
<summary>2. Explain each layout widget in Flutter and their respective usage contexts!</summary>

- Scaffold: This widget is a basic structure for implementing material design visual layout structure.
- Drawer: is a slide-in menu or panel that is typically used to provide navigation options to the user.
- Form: This widget is used to create a form, and wraps all the form fields and handles their validation.
- ListView: This widget is used to create a scrollable list of widgets, and contain the various form fields in a scrollable list
- TextFormField: This widget is used to create a text input field within a form.
- AppBar: This widget represents the app bar at the top of the screen.
</details>

<details>
<summary>3. List the form input elements you used in this assignment and explain why you used these input elements!</summary>

- TextFormField: This widget is used to create a text input field and validate it depending on the text field type.

</details>

<details>
<summary>4. How is clean architecture implemented in a Flutter application?</summary>

In the context of Flutter, clean architecture can be implemented by dividing the application into different layers: Presentation Layer, Domain Layer, and Data Layer. Each layer has its specific responsibilities and dependencies.

</details>

<details>
<summary>5. Explain how you implemented the checklist above step-by-step! (not just following the tutorial)</summary>

1. Separate the screen(UI) and widget file to different folders.

2. create a new input form so that the user can add a new item to the inventory.

3. create a `Drawer` to make the user easier to navigate through the inventory app.


</details>


### Assignment 9

<details>
<summary>1. Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?</summary>

Retrieving JSON data in Flutter typically involves making HTTP requests to a server or an API endpoint, but using a model, it's better to map it to object.



</details>

<details>

<summary>2. Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.</summary>

CookieRequest is a class that represents a request for a cookie. It is used to retrieve a cookie from the server. The cookie must be shared with other components in order to maintain the state.


</details>

<details>
<summary>3. Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.</summary>

Make an HTTP request, parsing the JSON response, and display it to the screen.


</details>

<details>
<summary>4. Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.</summary>

First, the user is prompted to enter their account credentials, and then Flutter sends the credentials to django to authenticate the account. If the accounts exist, then Django gives a response to flutter again with a cookie that we can use after logging in to display the menu.


</details>

<details>
<summary>5. List all the widgets you used in this assignment and explain their respective functions.</summary>

- FutureBuilder, A widget that builds itself based on a Future.

- GestureDetector, Detects gestures on its child and invokes a callback.

- AlertDialog, A pop-up dialog that informs the user about an event.

- ElevatedButton, A Material Design raised button.

- TextEditingController, Controllers for handling text input. Used to get the entered username and password.


</details>

#### Assignment 9 Step by step

<details>
<summary>1. Create custom models</summary>

```
// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

List<Items> itemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  String model;
  int pk;
  Fields fields;

  Items({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  String price;
  String category;
  String description;
  DateTime dateAdded;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.price,
    required this.category,
    required this.description,
    required this.dateAdded,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        category: json["category"],
        description: json["description"],
        dateAdded: DateTime.parse(json["date_added"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "price": price,
        "category": category,
        "description": description,
        "date_added": dateAdded.toIso8601String(),
      };
}

```


</details>

<details>
<summary>2. Login page</summary>

```
// ignore_for_file: use_build_context_synchronously

import 'package:adaminven/screen/menu.dart';
import 'package:adaminven/screen/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Adam Inven',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login Adam Inven',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    final response = await request
                        .login("http://localhost:8000/auth/login/", {
                      'username': username,
                      'password': password,
                    });

                    if (request.loggedIn) {
                      String message = response['message'];
                      String uname = response['username'];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text("$message Welcome, $uname.")),
                        );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login Failed'),
                          content: Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

</details>

<details>
<summary>3. Item lists page with detail</summary>

```
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:adaminven/models/item.dart';
import 'package:adaminven/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<Items>> fetchProduct() async {
    var url = Uri.parse('http://localhost:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Items> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Items.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(),
        builder: (context, AsyncSnapshot<List<Items>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Item available.",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  // Navigate to a new screen to show details when the card is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemDetailPage(item: snapshot.data![index]),
                    ),
                  );
                },
                child: Card(
                  color: Colors.black87,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  final Items item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.black, // Set card background color to black
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Set rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${item.fields.name}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber, // Set text color to gold
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Amount: ${item.fields.amount}",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Price: ${item.fields.price}",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Category: ${item.fields.category}",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Description: ${item.fields.description}",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Date Added: ${item.fields.dateAdded}",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```
</details>

<details>
<summary>4. Register Page (Bonus)</summary>

```
// ignore_for_file: unused_import, library_private_types_in_public_api, use_build_context_synchronously, prefer_const_constructors, unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adaminven/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  Future<Map<String, dynamic>> postJson(
    String url,
    Map<String, String> headers,
    Map<String, dynamic> body,
  ) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    // Parse the response JSON
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register Adam Inven',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _password1Controller,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _password2Controller,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password1 = _password1Controller.text;
                    String password2 = _password2Controller.text;

                    if (password1 != password2) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Registration Failed'),
                          content: const Text('Passwords do not match.'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                      return;
                    }

                    final response = await postJson(
                      "http://localhost:8000/auth/register/",
                      {
                        "Content-Type": "application/json",
                      },
                      {
                        'username': username,
                        'password1': password1,
                        'password2': password2,
                      },
                    );

                    if (response['message'] == 'Register Success!') {
                      String message = response['message'];
                      String uname = response['username'];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                              content:
                                  Text("$message Please login again, $uname.")),
                        );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Registration Failed'),
                          content: Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

</details>