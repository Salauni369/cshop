import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final String name;
  final String imagePath;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) => CartItem(
        name: name,
        imagePath: imagePath,
        price: price,
        quantity: quantity ?? this.quantity,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
        'price': price,
        'quantity': quantity,
      };

  static CartItem fromJson(Map<String, dynamic> json) => CartItem(
        name: json['name'] as String,
        imagePath: json['imagePath'] as String,
        price: (json['price'] as num).toDouble(),
        quantity: json['quantity'] as int,
      );
}

class CartProvider extends ChangeNotifier {
  static const String _storageKey = 'cart_items_v1';

  List<CartItem> _items = <CartItem>[];
  bool _loaded = false;

  List<CartItem> get items => List.unmodifiable(_items);
  int get count => _items.fold<int>(0, (sum, it) => sum + it.quantity);
  double get total => _items.fold<double>(0, (sum, it) => sum + (it.price * it.quantity));

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw != null) {
      final List<dynamic> list = jsonDecode(raw) as List<dynamic>;
      _items = list.map((e) => CartItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(_items.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, jsonString);
  }

  Future<void> addItem(CartItem item) async {
    await ensureLoaded();
    final index = _items.indexWhere((e) => e.name == item.name);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: _items[index].quantity + item.quantity);
    } else {
      _items.add(item);
    }
    await _persist();
    notifyListeners();
  }

  Future<void> removeItem(String name) async {
    await ensureLoaded();
    _items.removeWhere((e) => e.name == name);
    await _persist();
    notifyListeners();
  }

  Future<void> clear() async {
    _items.clear();
    await _persist();
    notifyListeners();
  }
}
