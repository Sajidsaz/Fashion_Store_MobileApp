import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../data/product_data.dart';

class CartViewModel extends ChangeNotifier {
  // ── State ──
  final List<Map<String, dynamic>> _items = [
    {'product': allProducts[1], 'qty': 1},
    {'product': allProducts[6], 'qty': 2},
  ];

  // ── Getters ──
  List<Map<String, dynamic>> get items => List.unmodifiable(_items);

  double get grossTotal =>
      _items.fold(0, (sum, i) => sum + (i['product'].price * i['qty']));

  double get promoDiscount => 0;
  double get saleDiscount  => grossTotal * 0.05;
  double get netTotal      => grossTotal - promoDiscount - saleDiscount;

  bool get isEmpty => _items.isEmpty;

  // ── Actions ──
  void incrementQty(int index) {
    _items[index]['qty']++;
    notifyListeners();
  }

  void decrementQty(int index) {
    if (_items[index]['qty'] > 1) {
      _items[index]['qty']--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void addProduct(Product product, {int qty = 1}) {
    final existing = _items.indexWhere(
      (i) => (i['product'] as Product).id == product.id,
    );
    if (existing >= 0) {
      _items[existing]['qty'] += qty;
    } else {
      _items.add({'product': product, 'qty': qty});
    }
    notifyListeners();
  }
}
