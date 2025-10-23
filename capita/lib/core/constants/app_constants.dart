import 'package:flutter/material.dart';

/// Global constants for styling, layout, and app info.
class AppConstants {
  // App info
  static const String appName = 'Capita';
  static const String appVersion = '1.0.0';

  // Layout
  static const double defaultPadding = 16.0;
  static const double cardRadius = 12.0;

  // Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 400);

  // Colors
  static const Color primaryColor = Colors.indigo;
  static const Color accentColor = Colors.amber;
  static const Color background = Color(0xFFF9F9F9);

  // Fonts
  static const double titleFontSize = 18.0;
  static const double subtitleFontSize = 14.0;
}
