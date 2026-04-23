import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/wishlist_view_model.dart';
import '../product/product_detail_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistViewModel>(
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
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios,
                            size: 20)),
                      Text('Wishlist',
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text('${vm.count} items',
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppTheme.textSecondary)),
                    ],
                  ),
                ),

                vm.isEmpty
                    ? _buildEmpty()
                    : Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16),
                          itemCount: vm.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.72,
                          ),
                          itemBuilder: (context, index) {
                            final product = vm.items[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ProductDetailScreen(
                                              product: product))),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.surface,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(
                                                    10)),
                                        child: Stack(
                                          children: [
                                            Image.asset(product.image,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (_, __, ___) =>
                                                        Container(
                                                            color: AppTheme
                                                                .border)),
                                            Positioned(
                                              top: 8, right: 8,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    vm.remove(index),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                      Icons.favorite,
                                                      size: 16,
                                                      color:
                                                          Colors.red),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(product.name,
                                              style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w600)),
                                          const SizedBox(height: 2),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Text(
                                                  'LKR ${product.price.toStringAsFixed(2)}',
                                                  style:
                                                      GoogleFonts.inter(
                                                          fontSize: 11,
                                                          color: AppTheme
                                                              .textSecondary)),
                                              Container(
                                                padding:
                                                    const EdgeInsets
                                                        .all(4),
                                                decoration:
                                                    const BoxDecoration(
                                                  color: AppTheme.primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                    Icons.add,
                                                    size: 12,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmpty() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite_border,
                size: 80, color: AppTheme.border),
            const SizedBox(height: 16),
            Text('Your Wishlist is Empty',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Save items you love here.',
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }
}
