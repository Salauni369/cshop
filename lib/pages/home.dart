// // Expanded(
// // child: ListView(
// // scrollDirection: Axis.horizontal,
// // children: const [
// // CoffeeTile(
// // coffeeName: "Cold Coffee",
// // coffeeImagePath: "assets/images/cf1.png",
// // description: "Smooth. Bold. Ice-cold.",
// // price: "4.50",
// // ),
// // CoffeeTile(
// // coffeeName: "Latte",
// // coffeeImagePath: "assets/images/latte.png",
// // description: "With almond milk.",
// // price: "3.20",
// // ),
// // CoffeeTile(
// // coffeeName: "Espresso",
// // coffeeImagePath: "assets/images/espresso.png",
// // description: "Strong & rich.",
// // price: "2.90",
// // ),
// // CoffeeTile(
// // coffeeName: "Cappuccino",
// // coffeeImagePath: "assets/images/cappuccino.png",
// // description: "Creamy delight.",
// // price: "3.70",
// // ),
// // ],
// // ),
// // ),
//
//
import 'package:flutter/material.dart';
import 'package:cshop/util/coffee_type.dart';
import 'package:cshop/util/coffee_tile.dart';

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
        elevation: 0,
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
              const TextField(
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Find your Coffee...",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xFF1E1E1E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Horizontal coffee types
              SizedBox(
                height: 60,
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
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

      // bottom nav - optional
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
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
                    "Welcome, Dear User 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer list items
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:cshop/util/coffee_type.dart';
// import 'package:cshop/util/coffee_tile.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   TextEditingController searchController = TextEditingController();
//
//   // Coffee types list: [name, isSelected]
//   final List<List<dynamic>> coffeeTypes = [
//     ["Cold Brew", true],
//     ["Latte", false],
//     ["Black coffee", false],
//     ["Espresso", false],
//     ["Dark Brew", false],
//     ["Cappucino", false],
//   ];
//
//   void coffeeTypeSelected(int index) {
//     setState(() {
//       for (int i = 0; i < coffeeTypes.length; i++) {
//         coffeeTypes[i][1] = false;
//       }
//       coffeeTypes[index][1] = true;
//     });
//   }
//
//   final List<Map<String, String>> allCoffees = [
//     {
//       "name": "Cold Coffee",
//       "image": "assets/images/cf1.png",
//       "description": "Smooth. Bold. Ice-cold.",
//       "price": "4.50",
//       "type": "Cold Brew",
//     },
//     {
//       "name": "Latte",
//       "image": "assets/images/hc2.png",
//       "description": "With almond milk.",
//       "price": "3.20",
//       "type": "Latte",
//     },
//     {
//       "name": "Espresso",
//       "image": "assets/images/hc3.png",
//       "description": "Strong & rich.",
//       "price": "2.90",
//       "type": "Espresso",
//     },
//     {
//       "name": "Cappuccino",
//       "image": "assets/images/hc4.png",
//       "description": "Creamy delight.",
//       "price": "3.70",
//       "type": "Cappucino",
//     },
//     {
//       "name": "Dark Coffee",
//       "image": "assets/images/cf4.png",
//       "description": "Rich desserts like chocolate cake or tiramisu",
//       "price": "3.70",
//       "type": "Dark Brew",
//     },
//     {
//       "name": "Ice Coffee",
//       "image": "assets/images/cf2.png",
//       "description": "Creamy delight.",
//       "price": "3.70",
//       "type": "Cold Brew",
//     },
//   ];
//
//   List<Map<String, String>> searchResults = [];
//
//   @override
//   void initState() {
//     super.initState();
//     searchResults = []; // initially empty
//   }
//
//   void filterCoffees(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         searchResults = [];
//       });
//       return;
//     }
//
//     setState(() {
//       searchResults = allCoffees.where((coffee) {
//         return coffee['name']!.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Decide which list to show: searchResults if not empty, else allCoffees
//     List<Map<String, String>> coffeesToShow =
//     searchResults.isNotEmpty ? searchResults : allCoffees;
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.black,
//         actions: const [
//           Padding(padding: EdgeInsets.only(right: 25.0)),
//           Icon(Icons.person, color: Colors.white),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 6),
//               const Text(
//                 "FIND THE BEST COFFEE FOR YOUHH....",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Search bar
//               TextField(
//                 controller: searchController,
//                 onChanged: (value) => filterCoffees(value),
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                   hintText: "Find your Coffee...",
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xFF1E1E1E),
//                   border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(12)),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Coffee types horizontal
//               SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: coffeeTypes.length,
//                   itemBuilder: (context, index) {
//                     return CoffeeType(
//                       coffeeType: coffeeTypes[index][0] as String,
//                       isSelected: coffeeTypes[index][1] as bool,
//                       onTap: () => coffeeTypeSelected(index),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 18),
//
//               // Coffee tiles
//               Expanded(
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: coffeesToShow.map((coffee) {
//                     return CoffeeTile(
//                       coffeeName: coffee['name']!,
//                       coffeeImagePath: coffee['image']!,
//                       description: coffee['description']!,
//                       price: coffee['price']!,
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cshop/util/coffee_type.dart';
// import 'package:cshop/util/coffee_tile.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // coffee types list: [name, isSelected]
//   final List<List<dynamic>> coffeeTypes = [
//     ["Cold Brew", true],
//     ["Latte", false],
//     ["Black coffee", false],
//     ["Espresso", false],
//     ["Dark Brew", false],
//     ["Cappucino", false],
//   ];
//
//   // all coffee data
//   final List<Map<String, String>> allCoffees = [
//     {
//       "name": "Cold Coffee",
//       "image": "assets/images/cf1.png",
//       "description": "Smooth. Bold. Ice-cold.",
//       "price": "4.50"
//     },
//     {
//       "name": "Latte",
//       "image": "assets/images/hc2.png",
//       "description": "With almond milk.",
//       "price": "3.20"
//     },
//     {
//       "name": "Espresso",
//       "image": "assets/images/hc3.png",
//       "description": "Strong & rich.",
//       "price": "2.90"
//     },
//     {
//       "name": "Cappuccino",
//       "image": "assets/images/hc4.png",
//       "description": "Creamy delight.",
//       "price": "3.70"
//     },
//     {
//       "name": "Dark Coffee",
//       "image": "assets/images/cf4.png",
//       "description": "Rich desserts like chocolate cake or tiramisu",
//       "price": "3.70"
//     },
//     {
//       "name": "Ice Coffee",
//       "image": "assets/images/cf2.png",
//       "description": "Creamy delight.",
//       "price": "3.70"
//     },
//   ];
//
//   String searchQuery = "";
//   String selectedType = "Cold Brew";
//
//   void coffeeTypeSelected(int index) {
//     setState(() {
//       for (int i = 0; i < coffeeTypes.length; i++) {
//         coffeeTypes[i][1] = false;
//       }
//       coffeeTypes[index][1] = true;
//       selectedType = coffeeTypes[index][0] as String;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // filter coffees by type and search query
//     final coffeesToShow = allCoffees.where((coffee) {
//       final matchesType = selectedType == "All" || coffee['name']!.contains(selectedType);
//       final matchesSearch = coffee['name']!.toLowerCase().contains(searchQuery.toLowerCase());
//       return matchesType && matchesSearch;
//     }).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.black,
//         actions: const [
//           Padding(padding: EdgeInsets.only(right: 25.0)),
//           Icon(Icons.person, color: Colors.white),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 6),
//               const Text(
//                 "FIND THE BEST COFFEE FOR YOUHH....",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Search bar
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     searchQuery = value;
//                   });
//                 },
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   hintText: "Find your Coffee...",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: Color(0xFF1E1E1E),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(12)),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Horizontal coffee types
//               SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: coffeeTypes.length,
//                   itemBuilder: (context, index) {
//                     return CoffeeType(
//                       coffeeType: coffeeTypes[index][0] as String,
//                       isSelected: coffeeTypes[index][1] as bool,
//                       onTap: () => coffeeTypeSelected(index),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 18),
//
//               // Coffee tiles in grid (3 per row)
//               Expanded(
//                 child: GridView.builder(
//                   itemCount: coffeesToShow.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                     childAspectRatio: 0.6,
//                   ),
//                   itemBuilder: (context, index) {
//                     final coffee = coffeesToShow[index];
//                     return CoffeeTile(
//                       coffeeName: coffee['name']!,
//                       coffeeImagePath: coffee['image']!,
//                       description: coffee['description']!,
//                       price: coffee['price']!,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
//         ],
//       ),
//     );
//   }
// }
//
//
//
