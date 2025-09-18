//
// import 'package:flutter/material.dart';
// import 'cart_model.dart';
//
// class CartPage extends StatefulWidget {
//   const CartPage({super.key});
//
//   @override
//   State<CartPage> createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   final CartModel cart = CartModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text("Your Cart"),
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(child: Text("Cart is empty"))
//           : Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cart.cartItems[index];
//                 return ListTile(
//                   leading: Image.asset(item.imagePath),
//                   title: Text(item.name),
//                   subtitle: Text(
//                       "Quantity: ${item.quantity} | \$${(item.price * item.quantity).toStringAsFixed(2)}"),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     onPressed: () {
//                       setState(() {
//                         cart.removeFromCart(item);
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               "Total: \$${cart.getTotalPrice().toStringAsFixed(2)}",
//               style: const TextStyle(
//                   fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
