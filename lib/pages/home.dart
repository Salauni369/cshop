
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
    return Scaffold(
      // AppBar
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.black,
        //leading: const Icon(Icons.menu, color: Colors.white),
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

              // Search icon only for ui not working
              // working on it next time kahe ke abhi abhi nye aaye hn
              const TextField(
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "Find your Coffee...",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
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

              // Coffee tiles (horizontal cards)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 9,
                  childAspectRatio: 0.9,

                  scrollDirection: Axis.vertical,

                  children: const [
                    CoffeeTile(
                      coffeeName: "Cold Coffee",
                      coffeeImagePath: "assets/images/cf1.png",
                      description: "Coffe with a fellow forwerd creemy and icce. very luraage buy one two free",
                      price: "4.50",
                    ),
                    CoffeeTile(
                      coffeeName: "Latte",
                      coffeeImagePath: "assets/images/hc2.png",
                      description: "With almond milk.",
                      price: "3.20",
                    ),
                    CoffeeTile(
                      coffeeName: "Espresso",
                      coffeeImagePath: "assets/images/hc3.png",
                      description: "Strong & rich.",
                      price: "2.90",
                    ),
                    CoffeeTile(
                      coffeeName: "Cappuccino",
                      coffeeImagePath: "assets/images/hc4.png",
                      description: "Creamy delight.",
                      price: "3.70",
                    ),


                    CoffeeTile(
                      coffeeName: "Dark Coffee",
                      coffeeImagePath: "assets/images/cf4.png",
                      description: "Rich desserts like chocolate cake or tiramisu",
                      price: "3.70",
                    ),
                    CoffeeTile(
                      coffeeName: "Ice Coffee",
                      coffeeImagePath: "assets/images/cf2.png",
                      description: "Creamy delight.",
                      price: "3.70",
                    ),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.black,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.black,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.black,),label: ""),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Coffee Shop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Welcome, 14ry sahab ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),


            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {

                Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
            ),
          ],
        ),
      ),

    );
  }
}






