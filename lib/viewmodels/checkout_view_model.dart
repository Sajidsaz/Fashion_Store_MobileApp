import 'package:flutter/foundation.dart';

class CheckoutViewModel extends ChangeNotifier {
  // ── State ──
  String _name            = '';
  String _address         = '';
  String _city            = '';
  String _phone           = '';
  String _selectedPayment = 'visa';
  bool   _orderPlaced     = false;

  // ── Getters ──
  String get name            => _name;
  String get address         => _address;
  String get city            => _city;
  String get phone           => _phone;
  String get selectedPayment => _selectedPayment;
  bool   get orderPlaced     => _orderPlaced;

  bool get isFormValid =>
      _name.isNotEmpty &&
      _address.isNotEmpty &&
      _city.isNotEmpty &&
      _phone.isNotEmpty;

  // ── Setters ──
  void setName(String v)    { _name    = v; notifyListeners(); }
  void setAddress(String v) { _address = v; notifyListeners(); }
  void setCity(String v)    { _city    = v; notifyListeners(); }
  void setPhone(String v)   { _phone   = v; notifyListeners(); }

  // ── Actions ──
  void selectPayment(String method) {
    _selectedPayment = method;
    notifyListeners();
  }

  Future<void> placeOrder() async {
    // Phase 2: real order API call goes here
    await Future.delayed(const Duration(milliseconds: 400));
    _orderPlaced = true;
    notifyListeners();
  }
}
