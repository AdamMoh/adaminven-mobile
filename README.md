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