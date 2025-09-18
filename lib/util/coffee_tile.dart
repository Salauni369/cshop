// import 'package:flutter/material.dart';
//
// class CoffeeTile extends StatelessWidget {
//   final String coffeeName;
//   final String coffeeImagePath;
//   final String description;
//   final String price;
//
//   const CoffeeTile({
//     super.key,
//     required this.coffeeName,
//     required this.coffeeImagePath,
//     required this.description,
//     required this.price,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25.0, bottom: 25),
//       child: Container(
//         width: 200,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.black54,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(coffeeImagePath),
//             ),
//
//             const SizedBox(height: 10),
//
//             // coffee name
//             Text(
//               coffeeName,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//
//             const SizedBox(height: 4),
//
//             // description
//             Text(
//               description,
//               style: const TextStyle(color: Colors.grey),
//             ),
//
//             const SizedBox(height: 8),
//
//             // price + add button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "\$$price",
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color: Colors.brown[400],
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: const Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


//

import 'package:flutter/material.dart';
class CoffeeTile extends StatelessWidget {
  final String coffeeName;
  final String coffeeImagePath;
  final String description;
  final String price;

  const CoffeeTile({
    super.key,
    required this.coffeeName,
    required this.coffeeImagePath,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        width: 200, // width increase ki
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300, // image height increase ki
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(coffeeImagePath),
                  fit: BoxFit.cover, // image properly fill kare container
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              coffeeName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              "\$${price}",
              style: const TextStyle(
                  color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

