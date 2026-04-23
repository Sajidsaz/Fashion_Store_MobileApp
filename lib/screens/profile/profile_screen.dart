import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import 'my_orders_screen.dart';
import 'my_profile_screen.dart';
import 'wishlist_screen.dart';
import 'address_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback? onLogout;
  const ProfileScreen({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),

              // ── Top Bar ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text('Account',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 24),

              // ── Avatar ──
              CircleAvatar(
                radius: 45,
                backgroundColor: AppTheme.surface,
                child: const Icon(Icons.person,
                  size: 50, color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 12),
              Text('S. Sajith Ahamed',
                style: GoogleFonts.inter(
                  fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('heysaz@gmail.com',
                style: GoogleFonts.inter(
                  fontSize: 13, color: AppTheme.textSecondary)),

              const SizedBox(height: 28),

              // ── Menu Items ──
              _ProfileMenuItem(
                icon: Icons.shopping_bag_outlined,
                label: 'My Orders',
                onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const MyOrdersScreen())),
              ),
              _ProfileMenuItem(
                icon: Icons.person_outline,
                label: 'My Profile',
                onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const MyProfileScreen())),
              ),
              _ProfileMenuItem(
                icon: Icons.favorite_border,
                label: 'Wishlist',
                onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const WishlistScreen())),
              ),
              _ProfileMenuItem(
                icon: Icons.location_on_outlined,
                label: 'Address',
                onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const AddressScreen())),
              ),
              _ProfileMenuItem(
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen())),
              ),

              const Divider(height: 32, indent: 16, endIndent: 16),

              // ── Logout ──
              _ProfileMenuItem(
                icon: Icons.logout,
                label: 'Logout',
                isDestructive: true,
                onTap: () {
                  if (onLogout != null) onLogout!();
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon,
        size: 22,
        color: isDestructive ? Colors.red : AppTheme.textPrimary),
      title: Text(label,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.red : AppTheme.textPrimary)),
      trailing: isDestructive
        ? null
        : const Icon(Icons.arrow_forward_ios,
            size: 14, color: AppTheme.textSecondary),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24, vertical: 2),
    );
  }
}