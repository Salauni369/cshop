

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
        width: 100, // width increase ki
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60, // image height increase ki
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(coffeeImagePath),
                  fit: BoxFit.cover, // image properly fill kare container
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              coffeeName,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              maxLines: 1,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 3 ),
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

