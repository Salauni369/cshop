import 'package:provider/provider.dart';
import 'package:cshop/providers/cart_provider.dart';
import 'package:cshop/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:cshop/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()..ensureLoaded()),
        ChangeNotifierProvider(create: (_) => AuthProvider()..load()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
