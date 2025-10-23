import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0A1A44); // deep navy
  static const Color accent = Color(0xFF4F9DFF);  // electric blue
  static const Color secondary = Color(0xFF38BDF8); // cyan tone
  static const Color background = Color(0xFFF4F7FB);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);

  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0A1A44), Color(0xFF1E3A8A), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
