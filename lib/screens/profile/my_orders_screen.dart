import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/order_view_model.dart';
import '../../models/order_model.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  Color _statusColor(String status) {
    switch (status) {
      case 'Delivered':  return Colors.green;
      case 'Processing': return Colors.orange;
      case 'Cancelled':  return Colors.red;
      default:           return AppTheme.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderViewModel>();

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
                    child: const Icon(Icons.arrow_back_ios, size: 20)),
                  Text('My Orders',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            // ── Orders List ──
            Expanded(
              child: vm.orders.isEmpty
                ? _buildEmpty()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: vm.orders.length,
                    itemBuilder: (context, index) =>
                      _OrderCard(
                        order: vm.orders[index],
                        statusColor: _statusColor),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_bag_outlined,
            size: 80, color: AppTheme.border),
          const SizedBox(height: 16),
          Text('No Orders Yet',
            style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Your order history will appear here.',
            style: GoogleFonts.inter(
              fontSize: 13, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;
  final Color Function(String) statusColor;
  const _OrderCard({required this.order, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(order.image,
              width: 70, height: 70, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 70, height: 70, color: AppTheme.border)),
          ),
          const SizedBox(width: 12),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(order.id,
                      style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: statusColor(order.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(order.status,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: statusColor(order.status))),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(order.items,
                  style: GoogleFonts.inter(
                    fontSize: 12, color: AppTheme.textSecondary)),
                const SizedBox(height: 4),
                Text(order.date,
                  style: GoogleFonts.inter(
                    fontSize: 11, color: AppTheme.textSecondary)),
                const SizedBox(height: 6),
                Text(order.total,
                  style: GoogleFonts.inter(
                    fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
