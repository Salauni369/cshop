import 'dart:async';

class FakeApi {
  static Future<String> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 700));
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Invalid credentials');
    }
    return 'fake_token_${DateTime.now().millisecondsSinceEpoch}';
  }

  static Future<String> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 900));
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('Invalid signup data');
    }
    return 'fake_token_${DateTime.now().millisecondsSinceEpoch}';
  }

  static Future<void> logout(String token) async {
    await Future.delayed(const Duration(milliseconds: 400));
  }

  static Future<String> processPayment(double amount) async {
    await Future.delayed(const Duration(seconds: 1));
    if (amount <= 0) throw Exception('Invalid amount');
    return 'payment_${DateTime.now().millisecondsSinceEpoch}';
  }
}
