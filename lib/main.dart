// import 'package:flutter/material.dart';
// import 'package:cshop/pages/home.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//       theme: ThemeData(brightness: Brightness.dark,
//       primarySwatch: Colors.orange,
//       ),
//
//     );
//   }
// }
//


// import 'package:flutter/material.dart';
// import 'package:cshop/pages/home.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.orange,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cshop/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}


