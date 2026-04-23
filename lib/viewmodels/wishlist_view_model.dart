import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../data/product_data.dart';

class WishlistViewModel extends ChangeNotifier {
  // ── State ──
  final List<Product> _items = [
    allProducts[0],
    allProducts[4],
    allProducts[19],
    allProducts[27],
  ];

  // ── Getters ──
  List<Product> get items => List.unmodifiable(_items);
  int get count           => _items.length;
  bool get isEmpty        => _items.isEmpty;

  bool contains(String productId) =>
      _items.any((p) => p.id == productId);

  // ── Actions ──
  void toggle(Product product) {
    final index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
