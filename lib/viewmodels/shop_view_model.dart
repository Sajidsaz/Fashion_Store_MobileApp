import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../models/filter_options_model.dart';
import '../data/product_data.dart';

class ShopViewModel extends ChangeNotifier {
  // ── State ──
  FilterOptions _filterOptions  = const FilterOptions();
  String _selectedCategory      = 'All';

  final List<String> categories = ['All', 'Men', 'Women', 'Kids', 'Shoes'];

  // ── Getters ──
  FilterOptions get filterOptions    => _filterOptions;
  String        get selectedCategory => _selectedCategory;
  bool          get hasActiveFilters => _filterOptions.hasActiveFilters;

  List<Product> get filteredProducts {
    List<Product> results = allProducts.where((p) {
      final catMatch = _selectedCategory == 'All' ||
          p.category == _selectedCategory;
      final filterCatMatch = _filterOptions.categories.isEmpty ||
          _filterOptions.categories.contains(p.category);
      final priceMatch = p.price >= _filterOptions.priceRange.start &&
          p.price <= _filterOptions.priceRange.end;
      return catMatch && filterCatMatch && priceMatch;
    }).toList();

    if (_filterOptions.sortBy == 'Price: Low to High') {
      results.sort((a, b) => a.price.compareTo(b.price));
    } else if (_filterOptions.sortBy == 'Price: High to Low') {
      results.sort((a, b) => b.price.compareTo(a.price));
    }
    return results;
  }

  List<Product> get bestsellerProducts =>
      allProducts.where((p) => p.bestseller).take(6).toList();

  List<Product> get latestProducts => allProducts.take(8).toList();

  // ── Actions ──
  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void applyFilters(FilterOptions options) {
    _filterOptions = options;
    notifyListeners();
  }

  void clearFilters() {
    _filterOptions    = const FilterOptions();
    _selectedCategory = 'All';
    notifyListeners();
  }
}
