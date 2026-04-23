import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  // ── State ──
  bool   _isLoggedIn       = false;
  bool   _obscurePassword  = true;
  String _email            = '';
  String _password         = '';
  String _name             = '';

  // ── Getters ──
  bool   get isLoggedIn      => _isLoggedIn;
  bool   get obscurePassword => _obscurePassword;
  String get email           => _email;
  String get password        => _password;
  String get name            => _name;

  // ── Actions ──
  void setEmail(String v)    { _email    = v; notifyListeners(); }
  void setPassword(String v) { _password = v; notifyListeners(); }
  void setName(String v)     { _name     = v; notifyListeners(); }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  /// Phase 1: mock login — Phase 2 will call Firebase Auth here.
  Future<bool> login() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  void logout() {
    _isLoggedIn = false;
    _email      = '';
    _password   = '';
    notifyListeners();
  }
}
