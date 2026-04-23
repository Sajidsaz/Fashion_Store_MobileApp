import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? onLoginSuccess;
  final bool goToSignup;

  const LoginScreen({
    super.key,
    this.onLoginSuccess,
    this.goToSignup = false,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword     = true;

  @override
  void initState() {
    super.initState();
    // If coming from Sign Up button, navigate to signup
    if (widget.goToSignup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(context,
          MaterialPageRoute(builder: (_) => SignupScreen(
            onSignupSuccess: widget.onLoginSuccess)));
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // For Phase 1 - just navigate back with success
    // Phase 2 will use Firebase Auth
    if (widget.onLoginSuccess != null) {
      widget.onLoginSuccess!();
    }
    Navigator.pop(context, true);
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
              const SizedBox(height: 60),

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
              Text('Login to your account',
                style: GoogleFonts.inter(
                  fontSize: 13, color: AppTheme.textSecondary,
                  letterSpacing: 1)),

              const SizedBox(height: 48),

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

              // ── Forgot Password ──
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.textSecondary)),
                ),
              ),

              const SizedBox(height: 8),

              // ── Login Button ──
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('LOGIN',
                  style: GoogleFonts.inter(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 24),

              // ── Sign Up Link ──
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.textSecondary)),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>
                        SignupScreen(
                          onSignupSuccess: widget.onLoginSuccess))),
                    child: Text('Sign Up',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}