//
//
// class Coffee {
//   final String name;
//   final String imagePath;
//   final String description;
//   final double price;
//   int quantity;
//
//   Coffee({
//     required this.name,
//     required this.imagePath,
//     required this.description,
//     required this.price,
//     this.quantity = 1,
//   });
// }
//
// class CartModel {
//   static final CartModel _instance = CartModel._internal();
//   factory CartModel() => _instance;
//   CartModel._internal();
//
//   final List<Coffee> _cartItems = [];
//
//   List<Coffee> get cartItems => _cartItems;
//
//   void addToCart(Coffee coffee) {
//     for (var item in _cartItems) {
//       if (item.name == coffee.name) {
//         item.quantity += 1;
//         return;
//       }
//     }
//     _cartItems.add(coffee);
//   }
//
//   void removeFromCart(Coffee coffee) {
//     _cartItems.removeWhere((item) => item.name == coffee.name);
//   }
//
//   double getTotalPrice() {
//     double total = 0.0;
//     for (var item in _cartItems) {
//       total += item.price * item.quantity;
//     }
//     return total;
//   }
//
//   void clearCart() {
//     _cartItems.clear();
//   }
// }
