import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF0A0E21);
  static const Color surface = Color(0xFF131829);
  static const Color card = Color(0xFF1A1F35);
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF00D9FF);
  static const Color accent = Color(0xFF9D4EDD);
  static const Color textPrimary = Color(0xFFF5F5F7);
  static const Color textSecondary = Color(0xFFA0A4B8);
  static const Color border = Color(0xFF252B45);
  static const Color success = Color(0xFF4ADE80);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        background: AppColors.background,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 64,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.15,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 17,
          color: AppColors.textSecondary,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15,
          color: AppColors.textSecondary,
          height: 1.6,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 13,
          color: AppColors.textSecondary,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.3)),
      ),
    );
  }
}