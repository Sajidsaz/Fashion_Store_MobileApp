import 'package:flutter/material.dart';

class FilterOptions {
  final String sortBy;
  final RangeValues priceRange;
  final List<String> sizes;
  final List<String> categories;

  const FilterOptions({
    this.sortBy     = 'Default',
    this.priceRange = const RangeValues(0, 12000),
    this.sizes      = const [],
    this.categories = const [],
  });

  bool get hasActiveFilters =>
      sortBy != 'Default' ||
      priceRange != const RangeValues(0, 12000) ||
      sizes.isNotEmpty ||
      categories.isNotEmpty;
}
