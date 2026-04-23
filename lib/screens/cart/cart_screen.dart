import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../viewmodels/cart_view_model.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
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
                      Navigator.canPop(context)
                          ? GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.arrow_back_ios,
                                  size: 20),
                            )
                          : const SizedBox(width: 24),
                      Text('My Cart',
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                ),

                vm.isEmpty ? _buildEmptyCart() : _buildCartContent(context, vm),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyCart() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined,
                size: 80, color: AppTheme.border),
            const SizedBox(height: 16),
            Text('Your Cart is Empty',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('When you add products,\nthey will appear here.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, CartViewModel vm) {
    return Expanded(
      child: Column(
        children: [
          // Cart Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: vm.items.length,
              itemBuilder: (context, index) {
                final item    = vm.items[index];
                final product = item['product'] as Product;
                final qty     = item['qty'] as int;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(product.image,
                            width: 70, height: 70, fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                                width: 70, height: 70,
                                color: AppTheme.border)),
                      ),
                      const SizedBox(width: 12),

                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.name,
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                GestureDetector(
                                  onTap: () => vm.removeItem(index),
                                  child: const Icon(Icons.close,
                                      size: 18,
                                      color: AppTheme.textSecondary),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                                'LKR ${product.price.toStringAsFixed(2)}',
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: AppTheme.textSecondary)),
                            const SizedBox(height: 8),

                            // Qty Stepper
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => vm.decrementQty(index),
                                  child: Container(
                                    width: 28, height: 28,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppTheme.border),
                                      borderRadius:
                                          BorderRadius.circular(6)),
                                    child: const Icon(Icons.remove,
                                        size: 14)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text('$qty',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.bold)),
                                ),
                                GestureDetector(
                                  onTap: () => vm.incrementQty(index),
                                  child: Container(
                                    width: 28, height: 28,
                                    decoration: BoxDecoration(
                                      color: AppTheme.primary,
                                      borderRadius:
                                          BorderRadius.circular(6)),
                                    child: const Icon(Icons.add,
                                        size: 14,
                                        color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ── Price Summary ──
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: Column(
              children: [
                _priceRow('Gross Total',
                    'LKR ${vm.grossTotal.toStringAsFixed(0)}'),
                _priceRow('Promo Discount',
                    '- LKR ${vm.promoDiscount.toStringAsFixed(0)}'),
                _priceRow('Sale Discount',
                    '- LKR ${vm.saleDiscount.toStringAsFixed(0)}'),
                const Divider(height: 20),
                _priceRow(
                    'Net Total',
                    'LKR ${vm.netTotal.toStringAsFixed(0)}',
                    isBold: true),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const CheckoutScreen())),
                  child: Text('PROCEED TO CHECKOUT',
                      style: GoogleFonts.inter(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  color: isBold
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                  fontWeight:
                      isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight:
                      isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
