import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../viewmodels/product_detail_view_model.dart';
import '../../viewmodels/cart_view_model.dart';
import '../../viewmodels/wishlist_view_model.dart';
import '../cart/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailViewModel(product),
      child: Consumer<ProductDetailViewModel>(
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
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios,
                              size: 20)),
                        Text(product.name,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const Icon(Icons.share_outlined, size: 22),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Main Image ──
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(12),
                              child: Image.asset(
                                product.image,
                                height: 280,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    Container(
                                  height: 280,
                                  color: AppTheme.surface,
                                  child: const Icon(
                                      Icons.image_outlined,
                                      size: 60),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // ── Thumbnail Gallery ──
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16),
                              itemCount: vm.images.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(8),
                                    child: Image.asset(
                                      vm.images[index],
                                      width: 60, height: 70,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          Container(
                                              width: 60,
                                              color:
                                                  AppTheme.surface),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 16),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                // ── Name & Price ──
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(product.name,
                                            style: GoogleFonts.inter(
                                                fontSize: 20,
                                                fontWeight:
                                                    FontWeight.bold)),
                                        Text(
                                          'LKR ${product.price.toStringAsFixed(2)}',
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              color: AppTheme
                                                  .textSecondary)),
                                      ],
                                    ),
                                    // Wishlist toggle
                                    Consumer<WishlistViewModel>(
                                      builder:
                                          (context, wishVm, _) {
                                        final wishlisted = wishVm
                                            .contains(product.id);
                                        return GestureDetector(
                                          onTap: () =>
                                              wishVm.toggle(product),
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(
                                                    10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppTheme.border),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8),
                                            ),
                                            child: Icon(
                                              wishlisted
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border,
                                              size: 22,
                                              color: wishlisted
                                                  ? Colors.red
                                                  : null),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // ── Size Selector ──
                                Text('Size',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight:
                                            FontWeight.w600)),
                                const SizedBox(height: 10),
                                Row(
                                  children: vm.sizes.map((size) {
                                    final isSelected =
                                        size == vm.selectedSize;
                                    return GestureDetector(
                                      onTap: () =>
                                          vm.selectSize(size),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 10),
                                        width: 42, height: 42,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppTheme.primary
                                              : AppTheme.surface,
                                          borderRadius:
                                              BorderRadius.circular(
                                                  8),
                                          border: Border.all(
                                            color: isSelected
                                                ? AppTheme.primary
                                                : AppTheme.border),
                                        ),
                                        child: Center(
                                          child: Text(size,
                                              style: GoogleFonts.inter(
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.w600,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : AppTheme
                                                          .textPrimary)),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),

                                const SizedBox(height: 20),

                                // ── Quantity ──
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Quantity',
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight:
                                                FontWeight.w600)),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: vm.decrementQty,
                                          child: Container(
                                            width: 32, height: 32,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppTheme.border),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      6)),
                                            child: const Icon(
                                                Icons.remove,
                                                size: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                          child: Text(
                                              '${vm.quantity}',
                                              style: GoogleFonts.inter(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.bold)),
                                        ),
                                        GestureDetector(
                                          onTap: vm.incrementQty,
                                          child: Container(
                                            width: 32, height: 32,
                                            decoration: BoxDecoration(
                                              color: AppTheme.primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      6)),
                                            child: const Icon(
                                                Icons.add,
                                                size: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // ── Description ──
                                Text('Description',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight:
                                            FontWeight.w600)),
                                const SizedBox(height: 8),
                                Text(
                                  product.description ??
                                      'Premium quality ${product.name.toLowerCase()} made from soft, breathable fabric. Perfect for everyday wear.',
                                  style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: AppTheme.textSecondary,
                                      height: 1.6)),

                                const SizedBox(height: 24),

                                // ── Buttons ──
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          context
                                              .read<CartViewModel>()
                                              .addProduct(product,
                                                  qty: vm.quantity);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Added to cart'),
                                              duration: Duration(
                                                  seconds: 1)),
                                          );
                                        },
                                        style:
                                            OutlinedButton.styleFrom(
                                          minimumSize:
                                              const Size(0, 50),
                                          side: const BorderSide(
                                              color: AppTheme.primary),
                                          shape:
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    8)),
                                        ),
                                        child: Text('Add to Cart',
                                            style: GoogleFonts.inter(
                                                color: AppTheme.primary,
                                                fontWeight:
                                                    FontWeight.bold)),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const CartScreen())),
                                        style:
                                            ElevatedButton.styleFrom(
                                          minimumSize:
                                              const Size(0, 50),
                                          shape:
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    8)),
                                        ),
                                        child: Text('Buy Now',
                                            style: GoogleFonts.inter(
                                                fontWeight:
                                                    FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
