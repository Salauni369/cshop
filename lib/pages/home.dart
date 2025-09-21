import 'package:flutter/material.dart';
import 'package:cshop/util/coffee_type.dart';
import 'package:cshop/util/coffee_tile.dart';
import 'package:cshop/pages/setting_screen.dart';
import 'package:cshop/pages/profile.dart';
import 'package:cshop/pages/logout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // coffee types list: [name, isSelected]
  final List<List<dynamic>> coffeeTypes = [
    ["Cold Brew", true],
    ["Latte", false],
    ["Black coffee", false],
    ["Espresso", false],
    ["Dark Brew", false],
    ["Cappucino", false],
  ];

  // Coffee list
  final List<Map<String, String>> coffees = [
    {
      "name": "Cold Coffee",
      "image": "assets/images/cf1.png",
      "description": "Coffe with a fellow forwerd creemy and icce. very luraage buy one two free",
      "price": "4.50"
    },
    {"name": "Latte", "image": "assets/images/hc2.png", "description": "With almond milk.", "price": "3.20"},
    {"name": "Espresso", "image": "assets/images/hc3.png", "description": "Strong & rich.", "price": "2.90"},
    {"name": "Cappuccino", "image": "assets/images/hc4.png", "description": "Creamy delight.", "price": "3.70"},
    {"name": "Dark Coffee", "image": "assets/images/cf4.png", "description": "Rich desserts like chocolate cake or tiramisu", "price": "3.70"},
    {"name": "Ice Coffee", "image": "assets/images/cf2.png", "description": "Creamy delight.", "price": "3.70"},
  ];

  TextEditingController searchController = TextEditingController();
  String searchText = "";

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filtered coffee list based on search text
    List<Map<String, String>> displayedCoffees = coffees
        .where((coffee) => coffee['name']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.black,
        actions: const [
          Padding(padding: EdgeInsets.only(right: 25.0)),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              const Text(
                "FIND THE BEST COFFEE FOR YOUHH....",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Working search bar
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  hintText: "Find your Coffee...",
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Horizontal coffee types
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTypes.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeeTypes[index][0] as String,
                      isSelected: coffeeTypes[index][1] as bool,
                      onTap: () => coffeeTypeSelected(index),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              // Responsive Coffee Tiles
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                  double childAspectRatio = constraints.maxWidth > 600 ? 1.2 : 0.9;

                  return GridView.builder(
                    itemCount: displayedCoffees.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 9,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      var coffee = displayedCoffees[index];
                      return CoffeeTile(
                        coffeeName: coffee['name']!,
                        coffeeImagePath: coffee['image']!,
                        description: coffee['description']!,
                        price: coffee['price']!,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.black), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.black), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: Colors.black), label: ""),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Coffee Shop",
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Welcome, 14ry sahab ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
