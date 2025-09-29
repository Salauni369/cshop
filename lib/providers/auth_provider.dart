import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/fake_api.dart';

class AuthProvider extends ChangeNotifier {
  static const String _tokenKey = 'auth_token_v1';

  String? _token;
  bool _loading = false;
  String? _error;

  String? get token => _token;
  bool get isAuthenticated => _token != null;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);
    notifyListeners();
  }

  Future<void> _saveToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    if (token == null) {
      await prefs.remove(_tokenKey);
    } else {
      await prefs.setString(_tokenKey, token);
    }
  }

  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final t = await FakeApi.login(email, password);
      _token = t;
      await _saveToken(t);
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final t = await FakeApi.signup(name, email, password);
      _token = t;
      await _saveToken(t);
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    if (_token != null) {
      await FakeApi.logout(_token!);
    }
    _token = null;
    await _saveToken(null);
    notifyListeners();
  }
}
