import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Brand Colors (from your Figma) ──
  static const Color primary     = Color(0xFF000000); // Black
  static const Color accent      = Color(0xFF7C3AED); // Purple
  static const Color background  = Color(0xFFFFFFFF); // White
  static const Color surface     = Color(0xFFF5F5F5); // Light grey
  static const Color textPrimary = Color(0xFF000000); // Black text
  static const Color textSecondary = Color(0xFF757575); // Grey text
  static const Color border      = Color(0xFFE0E0E0); // Border grey

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: accent,
        background: background,
        surface: surface,
      ),

      // ── Typography ──
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 28, fontWeight: FontWeight.bold, color: textPrimary),
        displayMedium: GoogleFonts.inter(
          fontSize: 22, fontWeight: FontWeight.bold, color: textPrimary),
        titleLarge: GoogleFonts.inter(
          fontSize: 18, fontWeight: FontWeight.w600, color: textPrimary),
        titleMedium: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w500, color: textPrimary),
        bodyLarge: GoogleFonts.inter(
          fontSize: 14, fontWeight: FontWeight.normal, color: textPrimary),
        bodySmall: GoogleFonts.inter(
          fontSize: 12, fontWeight: FontWeight.normal, color: textSecondary),
      ),

      // ── Input Fields ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: accent, width: 2),
        ),
        hintStyle: GoogleFonts.inter(fontSize: 14, color: textSecondary),
      ),

      // ── Elevated Button ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: background,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600,
            letterSpacing: 1.2),
        ),
      ),

      // ── AppBar ──
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18, fontWeight: FontWeight.bold, color: textPrimary),
        iconTheme: const IconThemeData(color: textPrimary),
      ),
    );
  }
}