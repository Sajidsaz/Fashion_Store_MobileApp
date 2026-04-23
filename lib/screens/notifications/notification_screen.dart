import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/notification_view_model.dart';
import '../../models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<NotificationViewModel>();

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
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20)),
                  const SizedBox(width: 12),
                  Text('Notifications',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            Expanded(
              child: vm.notifications.isEmpty
                ? _buildEmpty()
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _sectionHeader('Orders'),
                      const SizedBox(height: 8),
                      ...vm.orderNotifications
                          .map((n) => _NotifCard(notif: n)),
                      const SizedBox(height: 20),
                      _sectionHeader('Promotions & Offers'),
                      const SizedBox(height: 8),
                      ...vm.promoNotifications
                          .map((n) => _NotifCard(notif: n)),
                      const SizedBox(height: 24),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(title,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppTheme.textSecondary,
        letterSpacing: 0.8));
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.notifications_none_outlined,
            size: 72, color: AppTheme.border),
          const SizedBox(height: 16),
          Text('No Notifications',
            style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("You're all caught up!",
            style: GoogleFonts.inter(
              fontSize: 13, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}

class _NotifCard extends StatelessWidget {
  final AppNotification notif;
  const _NotifCard({required this.notif});

  IconData _iconForType(String iconType) {
    switch (iconType) {
      case 'shipping': return Icons.local_shipping_outlined;
      case 'offer':    return Icons.local_offer_outlined;
      case 'check':    return Icons.check_circle_outline;
      case 'new':      return Icons.new_releases_outlined;
      case 'receipt':  return Icons.receipt_long_outlined;
      case 'gift':     return Icons.card_giftcard_outlined;
      default:         return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOrder = notif.type == 'order';
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: isOrder
                ? Colors.black.withOpacity(0.06)
                : AppTheme.accent.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_iconForType(notif.iconType),
              size: 20,
              color: isOrder ? AppTheme.textPrimary : AppTheme.accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(notif.title,
                        style: GoogleFonts.inter(
                          fontSize: 13, fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 8),
                    Text(notif.time,
                      style: GoogleFonts.inter(
                        fontSize: 11, color: AppTheme.textSecondary)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(notif.body,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
