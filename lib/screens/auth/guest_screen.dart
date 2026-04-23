import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import 'login_screen.dart';

class GuestScreen extends StatelessWidget {
  final VoidCallback? onLoginSuccess;
  const GuestScreen({super.key, this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Icon ──
                Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: const Icon(Icons.person_outline,
                    size: 56, color: AppTheme.textSecondary),
                ),

                const SizedBox(height: 24),

                // ── Title ──
                Text('Guest User',
                  style: GoogleFonts.inter(
                    fontSize: 22, fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                Text(
                  'Login to view your profile,\ntrack orders and more.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    height: 1.6)),

                const SizedBox(height: 36),

                // ── Login Button ──
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(
                          onLoginSuccess: onLoginSuccess)),
                    );
                    if (result == true && onLoginSuccess != null) {
                      onLoginSuccess!();
                    }
                  },
                  child: Text('LOGIN',
                    style: GoogleFonts.inter(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold)),
                ),

                const SizedBox(height: 12),

                // ── Sign Up Button ──
                OutlinedButton(
                  onPressed: () async {
                    final result = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(
                          onLoginSuccess: onLoginSuccess,
                          goToSignup: true)),
                    );
                    if (result == true && onLoginSuccess != null) {
                      onLoginSuccess!();
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: AppTheme.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('SIGN UP',
                    style: GoogleFonts.inter(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}