// // lib/coffee_details.dart
// import 'package:flutter/material.dart';
// import 'cart_model.dart';
//
// class CoffeeDetailsPage extends StatelessWidget {
//   final Coffee coffee;
//   const CoffeeDetailsPage({super.key, required this.coffee});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(coffee.name),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart'); // cart.dart route
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               coffee.imagePath,
//               height: 250,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               coffee.name,
//               style: const TextStyle(
//                   fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               coffee.description,
//               style: const TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               "\$${coffee.price.toStringAsFixed(2)}",
//               style: const TextStyle(
//                   fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.brown,
//                 ),
//                 onPressed: () {
//                   CartModel().addToCart(coffee);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Added to Cart!")),
//                   );
//                 },
//                 child: const Text(
//                   "Add to Cart",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
