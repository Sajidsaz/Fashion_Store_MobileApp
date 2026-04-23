import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../data/product_data.dart';

class SearchViewModel extends ChangeNotifier {
  // ── State ──
  String _query = '';
  List<String> _recentSearches = [
    'Cotton Top',
    'Denim Jacket',
    'Palazzo Pants',
    'Kids Trouser',
  ];

  // ── Getters ──
  String       get query         => _query;
  List<String> get recentSearches => List.unmodifiable(_recentSearches);

  List<Product> get searchResults {
    if (_query.isEmpty) return [];
    return searchProducts(_query);
  }

  bool get hasQuery   => _query.isNotEmpty;
  bool get hasResults => searchResults.isNotEmpty;

  // ── Actions ──
  void onQueryChanged(String value) {
    _query = value;
    notifyListeners();
  }

  void submitSearch(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    _recentSearches.remove(trimmed);
    _recentSearches.insert(0, trimmed);
    if (_recentSearches.length > 6) {
      _recentSearches = _recentSearches.sublist(0, 6);
    }
    notifyListeners();
  }

  void selectRecent(String term) {
    _query = term;
    notifyListeners();
  }

  void clearQuery() {
    _query = '';
    notifyListeners();
  }

  void clearRecentSearches() {
    _recentSearches = [];
    notifyListeners();
  }
}
