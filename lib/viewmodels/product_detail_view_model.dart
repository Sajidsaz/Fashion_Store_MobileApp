import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailViewModel extends ChangeNotifier {
  // ── State ──
  final Product product;
  late String       _selectedSize;
  int               _quantity = 1;

  ProductDetailViewModel(this.product) {
    final sizes = product.sizes ?? ['S', 'M', 'L', 'XL'];
    _selectedSize = sizes.isNotEmpty ? sizes[sizes.length ~/ 2] : 'M';
  }

  // ── Getters ──
  String        get selectedSize => _selectedSize;
  int           get quantity     => _quantity;
  List<String>  get sizes        => product.sizes ?? ['S', 'M', 'L', 'XL'];
  List<String>  get images       => product.images ?? [product.image];

  // ── Actions ──
  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void incrementQty() {
    _quantity++;
    notifyListeners();
  }

  void decrementQty() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }
}
