# rafis_inventory_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Assignment 7 
<details>
<summary>Steps</summary> 


1. Install Flutter using Homebrew
`brew install flutter`

2. Create a flutter project called rafis_inventory by running the following command :
`flutter create rafis_inventory`

3. Add this code to the `main.dart file` : 
```dart
import 'package:flutter/material.dart';
import 'package:rafis_inventory/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rafis Inventory',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

4. In the `lib` directory, create a `menu.dart` file

5. In the menu.dart file, copy this code
```dart
import 'package:flutter/material.dart';

class Items {
  final String name;
  final IconData icon;
  final Color color;

  Items(this.name, this.icon, this.color);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Items> items = [
    Items("View Items", Icons.checklist, Colors.indigo.shade400),
    Items("Add Item", Icons.add_shopping_cart, Colors.blue.shade400),
    Items("Logout", Icons.logout, Colors.red.shade400),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rafi\'s Inventory',
        ),
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
                  'My inventory', // Text indicating the shop name
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
                children: items.map((Items item) {
                  // Iteration for each item
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Items item;

  const ItemCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
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

6. The previous step already included the Snackbar
</details>


<details>
<summary>Stateless vs Stateful in Flutter</summary>


If a widget can change when a user interacts with it, it's stateful. Meanwhile, a stateless widget
never changes. The examples of stateless widgets are `Icon`, `IconButton`, and `Text`.

One can also say that a stateful widget is dynamic. A notable example would be it changing appearance
in response to interactions by user or when the widget receives data

Source : [Click here to access the flutter docs](https://docs.flutter.dev/ui/interactivity#stateful-and-stateless-widgets)
</details>

<details>
<summary>Widgets in my app</summary>


In `main.dart`:

1. `MaterialApp`: This is the root widget that configures your app. It provides a basic structure for your app, including the title and theme.

2. `MyApp`: This is your custom widget that extends StatelessWidget and represents the root of your app. It doesn't change its appearance once it's built.


In `menu.dart`:

1. `Scaffold:` This widget creates the basic layout of your app with an app bar and content area.

2. `AppBar`: It's the top app bar that displays the title of your app.

3. `SingleChildScrollView`: This widget allows content to be scrollable, ensuring that all content fits on the screen, even if it's too long.

4. `Column`: It's used to arrange widgets vertically, making it easy to stack items on top of each other.

5. `GridView.count`: This widget creates a grid layout with a specified number of columns. It's used to display a grid of items.

6. `ItemCard`: This is your custom widget that represents each item in the grid. It's built using a colored container with an icon and a label.

These widgets are building blocks that help you create the structure and appearance of your Flutter app. They work together to display your app's content and functionality in an organized manner.
</details>


## Assignment 8
<details> 
<summary>Steps</summary>

1. Create a `screens` directory in the `lib` directory
2. Move the `menu.dart` file to the `screens` folder and refactor the file
3. Create `additem_form.dart` file in the `screens` folder
4. Fill in the `additem_form.dart` file with this code:
```dart
import 'package:flutter/material.dart';
import 'package:rafis_inventory_mobile/widgets/left_drawer.dart';

class ItemFormPage extends StatefulWidget {
    const ItemFormPage({super.key});

    @override
    State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Item Form',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Item Name",
                        labelText: "Item Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Amount cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Amount must be a number!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description cannot be empty!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Product successfully saved'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: $_name'),
                                        Text('Price: $_amount'),
                                        Text('Description: $_description')
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          _formKey.currentState!.reset();
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        );
    }
}
```
5. Create a `widgets` folder
6. In that folder, add a new file called `left_drawer.dart`
7. Fill in the file with this following code
```dart
import 'package:flutter/material.dart';
import 'package:rafis_inventory_mobile/screens/menu.dart';
import 'package:rafis_inventory_mobile/screens/additem_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Rafi\'s Inventory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                    "Trusted, safe, reliable, all in here",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Item'),
            // redirect to ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```
8. Create an `item_card.dart` file in the `widgets` folder and fill it with this code
```dart
import 'package:flutter/material.dart';
import 'package:rafis_inventory_mobile/screens/additem_form.dart';

class Item {
  final String name;
  final IconData icon;
  final Color color;
  Item(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive to touch
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemFormPage(),
                ));
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
9. Modify your `screens/menu.dart` file's code into this
```dart
import 'package:flutter/material.dart';
import 'package:rafis_inventory_mobile/widgets/left_drawer.dart';
import 'package:rafis_inventory_mobile/widgets/item_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item("View Items", Icons.checklist, Colors.indigo.shade400),
    Item("Add Item", Icons.add_shopping_cart, Colors.blue.shade400),
    Item("Logout", Icons.logout, Colors.red.shade400),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rafi\'s Inventory',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
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
                  'Inventory', // Text indicating the shop name
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
                children: items.map((Item item) {
                  // Iteration for each item
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

</details>


<details>
<summary>push vs pushReplacement</summary>

Navigator.push() adds a new screen to the stack. After adding the screen and when you press the back button or Navigator.pop() you can go back to the previous screen. Meanwhile, Navigator.pushReplacement() adds a new screen to the stack but replaces the current screen, which prevents users to go back to the previous screen.

</details>

<details>
<summary>Layout Widgets in Flutter</summary>

- Stack : Allows widgets to be stacked on top of each other
- Row & Column : Used for arranging widgets horizontally and vertically, respectively
- Container : Provides a way to style, pad, and position a single child widget within it
- ListView and GridView : Assist in creating scrollable lists and grids of items.
</details>


<details>
<summary>Form Input Elements in Rafi's Inventory</summary>

The only form input element that I used in this assignment is TextFormField.
I use it because I want the input to be a string and also integrated 
with a `form` widget for handling validation and submission. Also for the amount
problem (since it should be numbers), we can parse that into an integer.
</details>

<details>
<summary>Clean Architecture in Flutter</summary>

A way to organize your codebase into 3 layers, which are presentation, domain, and data.
The presentation layer is for the screens that displaying information to the user
and also interact with the layers below it. Domain layer is where you have the core
logic of your application. Data layer is where you deal with data retreival and storage

</details>


## Assignment 9
Disclaimer: My django deployment haven't been successful yet, so I use the localhost

<details>
<summary>Steps</summary>

1. Create a login page `login.dart` in your `lib/screens` directory and fill in with this code
```dart
import 'package:rafis_inventory_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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

                // Check credentials
                // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
                // To connect the Android emulator to Django on localhost,
                // use the URL http://10.0.2.2/
                final response =
                    await request.login("http://127.0.0.1:8000/auth/login/", {
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
                        SnackBar(content: Text("$message Welcome, $uname.")));
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
          ],
        ),
      ),
    );
  }
}
```

2. Integrate django app for flutter
  - run `python manage.py startapp authentication` in your django project
  - add `'authenctication',` to `INSTALLED_APPS` in your `settings.py` file
  - run `pip install django-cors-headers`
  - add `corsheaders` to the `INSTALLED_APPS` in `settings.py`
  - add `corsheaders.middleware.CorsMiddleware` to the `MIDDLEWARE` in `settings.py`
  - add this code below to the bottom of `settings.py`

    ```py
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```

  - fill in your `authentication/views.py` with this code:
    ```py
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt


    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Successful login status.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login successful!"
                    # Add other data if you want to send data to Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login failed, account disabled."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, check email or password again."
            }, status=401)
        
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logged out successfully!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout failed."
            }, status=401)
    ```

3. Integrate authentication system in flutter by going to the `main.dart` and modify `MyApp` class to this:
```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
          ),
          home: MyHomePage()),
    );
  }
}
```

4. Create an `item.dart` file in `lib/models`
5. Fill in item.dart with this
```dart
// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  String model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
  String description;
  String category;
  int damage;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.description,
    required this.category,
    required this.damage,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        category: json["category"],
        damage: json["damage"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "category": category,
        "damage": damage,
      };
}
```

6. Add a navigator in the home page and drawer

  `left_drawer.dart`

    ```dart
    ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Item List'),
              onTap: () {
                // Route menu to product page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ItemPage()),
                );
              },
            ),
    ```

  `home_widgets.dart`
    ```dart
    else if (item.name == "View Items") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemPage()),
              );
            }
    ```

7. Integrate item addition in django for flutter
  - In your `django_project/main/views.py`, add this code:
    ```py
    def create_product_flutter(request):
      if request.method == 'POST':
          
          data = json.loads(request.body)

          new_product = Items.objects.create(
              user = request.user,
              name = data["name"],
              amount = int(data["amount"]),
              description = data["description"],
              category = data["category"],
              damage = int(data["damage"])
          )

          new_product.save()

          return JsonResponse({"status": "success"}, status=200)
      else:
          return JsonResponse({"status": "error"}, status=401)
    ```
  - Back to the `flutter_project/lib/screens/additem_form.dart`, modify
    this part of the code to connect CookieRequest:
      ```dart
      //..
      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold('...')
        //...
      }
      ```

  - Change the onPressed logic to:
    ```dart
    onPressed: () async {
      if (_formKey.currentState!.validate()) {
        // Send request to Django and wait for the response
        final response = await request.postJson(
            "http://127.0.0.1:8000/create-flutter/",
            jsonEncode(<String, String>{
              'name': _name,
              'amount': _amount.toString(),
              'description': _description,
              'category': _category,
              'damage': _damage.toString()
            }));
        if (response['status'] == 'success') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text("New item has saved successfully!"),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
                Text("Something went wrong, please try again."),
          ));
        }
      }
    },
    ```

8. Create a `view_item.dart` in the `lib/screens` directory and fill in with this code:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:rafis_inventory_mobile/models/item.dart';
  import 'package:rafis_inventory_mobile/widgets/left_drawer.dart';
  import 'package:rafis_inventory_mobile/screens/item_detail.dart';

  class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
  }

  class _ItemPageState extends State<ItemPage> {
    Future<List<Item>> fetchProduct() async {
      var url = Uri.parse('http://127.0.0.1:8000/json/');
      var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      // decode the response to JSON
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // convert the JSON to Product object
      List<Item> list_item = [];
      for (var d in data) {
        if (d != null) {
          list_item.add(Item.fromJson(d));
        }
      }
      return list_item;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Items'),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchProduct(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          "No item data available.",
                          style:
                              TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetailPage(
                                          item: snapshot.data![index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text("${snapshot.data![index].fields.description}"),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            )));
                  }
                }
              }));
    }
  }

  ```

9. Create an `item_detail.dart` page so that when you click an item, you
   see the details of the attribute in that page
  
  ```dart
  import 'package:flutter/material.dart';
  import 'package:rafis_inventory_mobile/models/item.dart';
  import 'package:rafis_inventory_mobile/widgets/left_drawer.dart';

  class ItemDetailPage extends StatelessWidget {
    final Item item;

    const ItemDetailPage({Key? key, required this.item}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Item Details'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.fields.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text("Amount: ${item.fields.amount}"),
              const SizedBox(height: 10),
              Text("Description: ${item.fields.description}"),
              const SizedBox(height: 10),
              Text("Category: ${item.fields.category}"),
              const SizedBox(height: 10),
              Text("Damage: ${item.fields.damage}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the item list page
                },
                child: const Text('Back to Item List'),
              ),
            ],
          ),
        ),
      );
    }
  }
  ```
</details>


<details>
<summary>Retrieving JSON data without model?</summary>

Yes, it's possible. But it's still preferred and better to create a model first,
since it's more maintainable and readable
</details>


<details>
<summary>CookieRequest</summary>

CookieRequest is a class that represents a request for a cookie. It is used to retrieve a cookie from the server. 
A CookieRequest instance needs to be shared with all components in a Flutter application because it is used to 
retrieve a cookie from the server.
</details>


<details>
<summary>Fetching JSON data mechanism in Flutter</summary>

Using the http library, we fetch the data. After that we parse it using the dart:convert library.
Finally, we put it in a model and then we can display it on a screen such as `item_detail.dart` and
`view_item.dart`
</details>


<details>
<summary>Authentication mechanism from Flutter to Django</summary>

We use the `pbp_django_auth` to post a request to login, so that we can get the cookies and 
use it after login. After the cookies has been set, we can display the menu.

</details>


<details>
<summary>Widgets</summary>

  - `FutureBuilder`: FutureBuilder is a widget that utilizes the result of a Future to build itself, which
    performs asynchronous activities.

  - `ListView`: to display the children as a list layout.

  - `TextFormField`: A widget to accept text inputs and handles validation and 
                     integration with other FormField widgets

  - `ElevatedButton`: A widget used to create a button

  - `Container`: A container for widgets

  - `InkWell`: Used to respond after clicking the item

</details>