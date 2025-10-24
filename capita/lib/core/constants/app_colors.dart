import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4A148C); // purple
  static const Color accent = Color(0xFFB39DDB);  // light purple accent
  static const Color secondary = Color(0xFF7E57C2); // mid purple
  static const Color background = Color(0xFFF4F7FB);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);

  static const Gradient primaryGradient = LinearGradient(
    colors: [Color.fromARGB(255, 31, 30, 31), Color(0xFF4A148C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
