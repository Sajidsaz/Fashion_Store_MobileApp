import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback? onSignupSuccess;
  const SignupScreen({super.key, this.onSignupSuccess});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController     = TextEditingController();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController  = TextEditingController();
  bool _obscurePassword     = true;
  bool _obscureConfirm      = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (widget.onSignupSuccess != null) {
      widget.onSignupSuccess!();
    }
    // Pop all the way back to home
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // ── Back Button ──
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, size: 20),
                ),
              ),

              const SizedBox(height: 24),

              // ── Logo ──
              Text('HEYSAZ',
                style: GoogleFonts.inter(
                  fontSize: 32, fontWeight: FontWeight.bold,
                  letterSpacing: 6, color: AppTheme.textPrimary)),
              const SizedBox(height: 6),
              Text('Create your account',
                style: GoogleFonts.inter(
                  fontSize: 13, color: AppTheme.textSecondary,
                  letterSpacing: 1)),

              const SizedBox(height: 40),

              // ── Full Name ──
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline, size: 20),
                  hintText: 'Full Name',
                ),
              ),
              const SizedBox(height: 16),

              // ── Email ──
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, size: 20),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 16),

              // ── Password ──
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline, size: 20),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined, size: 20),
                    onPressed: () => setState(
                      () => _obscurePassword = !_obscurePassword),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ── Confirm Password ──
              TextField(
                controller: _confirmController,
                obscureText: _obscureConfirm,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline, size: 20),
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirm
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined, size: 20),
                    onPressed: () => setState(
                      () => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── Create Account Button ──
              ElevatedButton(
                onPressed: _handleSignup,
                child: Text('CREATE ACCOUNT',
                  style: GoogleFonts.inter(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 24),

              // ── Login Link ──
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.textSecondary)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text('Login',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        decoration: TextDecoration.underline)),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}