import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../viewmodels/shop_view_model.dart';
import '../../viewmodels/wishlist_view_model.dart';
import '../product/product_detail_screen.dart';
import 'filter_sheet.dart';
import '../search/search_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          backgroundColor: AppTheme.background,
          body: SafeArea(
            child: Column(
              children: [
                // ── Top Bar ──
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 24),
                      Text('Shop',
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const Icon(Icons.notifications_outlined, size: 22),
                    ],
                  ),
                ),

                // ── Search Bar + Filter Button ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (_) => const SearchScreen())),
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: AppTheme.surface,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: AppTheme.border),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 12),
                                const Icon(Icons.search,
                                    size: 20,
                                    color: AppTheme.textSecondary),
                                const SizedBox(width: 8),
                                Text('Search Products',
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color:
                                            AppTheme.textSecondary)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Filter Button
                      GestureDetector(
                        onTap: () async {
                          final result =
                              await showModalBottomSheet<FilterOptions>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => FilterSheet(
                                initialOptions: vm.filterOptions),
                          );
                          if (result != null) vm.applyFilters(result);
                        },
                        child: Container(
                          height: 42, width: 42,
                          decoration: BoxDecoration(
                            color: vm.hasActiveFilters
                                ? AppTheme.primary
                                : AppTheme.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.border),
                          ),
                          child: Icon(Icons.tune,
                              size: 20,
                              color: vm.hasActiveFilters
                                  ? Colors.white
                                  : AppTheme.textPrimary),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // ── Category Chips ──
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: vm.categories.map((label) {
                      final isSelected =
                          label == vm.selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () => vm.selectCategory(label),
                          child: Text(
                            label,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: isSelected
                                  ? AppTheme.textPrimary
                                  : AppTheme.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Product Grid ──
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16),
                    child: GridView.builder(
                      itemCount: vm.filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final product =
                            vm.filteredProducts[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailScreen(
                                          product: product))),
                          child: _ShopProductCard(
                              product: product),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ShopProductCard extends StatelessWidget {
  final Product product;
  const _ShopProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistViewModel>(
      builder: (context, wishlistVm, _) {
        final isWishlisted = wishlistVm.contains(product.id);
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10)),
                  child: Stack(
                    children: [
                      Image.asset(product.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                              color: AppTheme.border,
                              child: const Icon(
                                  Icons.image_outlined,
                                  size: 40))),
                      Positioned(
                        top: 8, right: 8,
                        child: GestureDetector(
                          onTap: () =>
                              wishlistVm.toggle(product),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isWishlisted
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 16,
                              color: isWishlisted
                                  ? Colors.red
                                  : AppTheme.textSecondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(
                        'LKR ${product.price.toStringAsFixed(2)}',
                        style: GoogleFonts.inter(
                            fontSize: 11,
                            color: AppTheme.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
