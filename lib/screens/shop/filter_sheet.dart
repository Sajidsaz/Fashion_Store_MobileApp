import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../models/filter_options_model.dart';

export '../../models/filter_options_model.dart';

class FilterSheet extends StatefulWidget {
  final FilterOptions initialOptions;
  const FilterSheet({super.key, required this.initialOptions});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late String       _selectedSort;
  late RangeValues  _priceRange;
  late List<String> _selectedSizes;
  late List<String> _selectedCategories;

  final List<String> _sortOptions = [
    'Default', 'Price: Low to High',
    'Price: High to Low', 'Newest First',
  ];

  final List<String> _sizes      = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<String> _categories = ['Men', 'Women', 'Kids', 'Shoes'];

  @override
  void initState() {
    super.initState();
    _selectedSort       = widget.initialOptions.sortBy;
    _priceRange         = widget.initialOptions.priceRange;
    _selectedSizes      = List.from(widget.initialOptions.sizes);
    _selectedCategories = List.from(widget.initialOptions.categories);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Handle ──
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40, height: 4,
            decoration: BoxDecoration(
              color: AppTheme.border,
              borderRadius: BorderRadius.circular(2)),
          ),

          // ── Header ──
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filters',
                  style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () => setState(() {
                    _selectedSort       = 'Default';
                    _priceRange         = const RangeValues(0, 12000);
                    _selectedSizes      = [];
                    _selectedCategories = [];
                  }),
                  child: Text('Reset All',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.accent,
                      fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),

          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── Sort By ──
                  _sectionTitle('Sort By'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8, runSpacing: 8,
                    children: _sortOptions.map((option) {
                      bool isSelected = option == _selectedSort;
                      return GestureDetector(
                        onTap: () =>
                          setState(() => _selectedSort = option),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                              ? AppTheme.primary : AppTheme.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                ? AppTheme.primary : AppTheme.border)),
                          child: Text(option,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                ? Colors.white : AppTheme.textPrimary)),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // ── Price Range ──
                  _sectionTitle('Price Range'),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LKR ${_priceRange.start.toInt()}',
                        style: GoogleFonts.inter(
                          fontSize: 12, color: AppTheme.textSecondary)),
                      Text('LKR ${_priceRange.end.toInt()}',
                        style: GoogleFonts.inter(
                          fontSize: 12, color: AppTheme.textSecondary)),
                    ],
                  ),
                  RangeSlider(
                    values: _priceRange,
                    min: 0, max: 12000,
                    divisions: 20,
                    activeColor: AppTheme.primary,
                    inactiveColor: AppTheme.border,
                    onChanged: (values) =>
                      setState(() => _priceRange = values),
                  ),

                  const SizedBox(height: 24),

                  // ── Category ──
                  _sectionTitle('Category'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8, runSpacing: 8,
                    children: _categories.map((cat) {
                      bool isSelected = _selectedCategories.contains(cat);
                      return GestureDetector(
                        onTap: () => setState(() {
                          isSelected
                            ? _selectedCategories.remove(cat)
                            : _selectedCategories.add(cat);
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                              ? AppTheme.primary : AppTheme.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                ? AppTheme.primary : AppTheme.border)),
                          child: Text(cat,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                ? Colors.white : AppTheme.textPrimary)),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // ── Size ──
                  _sectionTitle('Size'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8, runSpacing: 8,
                    children: _sizes.map((size) {
                      bool isSelected = _selectedSizes.contains(size);
                      return GestureDetector(
                        onTap: () => setState(() {
                          isSelected
                            ? _selectedSizes.remove(size)
                            : _selectedSizes.add(size);
                        }),
                        child: Container(
                          width: 46, height: 46,
                          decoration: BoxDecoration(
                            color: isSelected
                              ? AppTheme.primary : AppTheme.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                ? AppTheme.primary : AppTheme.border)),
                          child: Center(
                            child: Text(size,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                  ? Colors.white : AppTheme.textPrimary)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 28),

                  // ── Apply Button ──
                  ElevatedButton(
                    onPressed: () => Navigator.pop(
                      context,
                      FilterOptions(
                        sortBy:     _selectedSort,
                        priceRange: _priceRange,
                        sizes:      _selectedSizes,
                        categories: _selectedCategories,
                      ),
                    ),
                    child: Text('APPLY FILTERS',
                      style: GoogleFonts.inter(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title,
      style: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.bold));
  }
}
