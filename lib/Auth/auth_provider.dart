import 'package:flutter/material.dart';
import 'auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _token;

  String? get token => _token;

  Future<void> login(String username, String password) async {
    _token = await _authService.login(username, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _token = null;
    notifyListeners();
  }

  Future<void> checkToken() async {
    _token = await _authService.getToken();
    notifyListeners();
  }
}
