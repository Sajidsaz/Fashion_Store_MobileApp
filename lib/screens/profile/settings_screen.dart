import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/settings_view_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SettingsViewModel>();

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
                  Text('Settings',
                    style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Notifications Section ──
                    _sectionHeader('Notifications'),
                    _buildToggle(
                      icon: Icons.notifications_outlined,
                      label: 'Push Notifications',
                      value: vm.notifications,
                      onChanged: vm.setNotifications,
                    ),
                    _buildToggle(
                      icon: Icons.local_shipping_outlined,
                      label: 'Order Updates',
                      value: vm.orderUpdates,
                      onChanged: vm.setOrderUpdates,
                    ),
                    _buildToggle(
                      icon: Icons.campaign_outlined,
                      label: 'Promotions & Offers',
                      value: vm.promotions,
                      onChanged: vm.setPromotions,
                    ),

                    const Divider(height: 24, indent: 16, endIndent: 16),

                    // ── Appearance Section ──
                    _sectionHeader('Appearance'),
                    _buildToggle(
                      icon: Icons.dark_mode_outlined,
                      label: 'Dark Mode',
                      value: vm.darkMode,
                      onChanged: vm.setDarkMode,
                    ),

                    const Divider(height: 24, indent: 16, endIndent: 16),

                    // ── General Section ──
                    _sectionHeader('General'),
                    _buildArrowTile(
                      icon: Icons.language_outlined,
                      label: 'Language',
                      trailing: vm.language,
                      onTap: () => _showLanguagePicker(context, vm),
                    ),
                    _buildArrowTile(
                      icon: Icons.help_outline,
                      label: 'Help Center',
                      onTap: () {},
                    ),
                    _buildArrowTile(
                      icon: Icons.privacy_tip_outlined,
                      label: 'Privacy Policy',
                      onTap: () {},
                    ),
                    _buildArrowTile(
                      icon: Icons.info_outline,
                      label: 'About App',
                      trailing: 'v1.0.0',
                      onTap: () {},
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguagePicker(BuildContext context, SettingsViewModel vm) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Language',
              style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...['English', 'Sinhala', 'Tamil'].map((lang) =>
              ListTile(
                title: Text(lang,
                  style: GoogleFonts.inter(fontSize: 14)),
                trailing: vm.language == lang
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
                onTap: () {
                  vm.setLanguage(lang);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: Text(title,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppTheme.textSecondary,
          letterSpacing: 1)),
    );
  }

  Widget _buildToggle({
    required IconData icon,
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, size: 22, color: AppTheme.textPrimary),
      title: Text(label,
        style: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: Switch(
        value: value,
        activeColor: AppTheme.primary,
        onChanged: onChanged,
      ),
      contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    );
  }

  Widget _buildArrowTile({
    required IconData icon,
    required String label,
    String? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 22, color: AppTheme.textPrimary),
      title: Text(label,
        style: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null)
            Text(trailing,
              style: GoogleFonts.inter(
                fontSize: 13, color: AppTheme.textSecondary)),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_forward_ios,
            size: 14, color: AppTheme.textSecondary),
        ],
      ),
      contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    );
  }
}
