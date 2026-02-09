import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // Primary and Secondary colors
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF1FA39A);

  // Light theme colors
  static const Color lightBackground = Color(0xFFF7F9FC);
  static const Color lightForeground = Color(0xFF0F172A);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightMuted = Color(0xFFEEF2F6);
  static const Color lightBorder = Color(0xFFE1E7EF);

  // Dark theme colors
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkForeground = Color(0xFFF8FAFC);
  static const Color darkCard = Color(0xFF111C2E);
  static const Color darkMuted = Color(0xFF1E293B);
  static const Color darkBorder = Color(0xFF1E293B);

  // Dynamic colors based on theme mode
  static Color getBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightBackground
        : darkBackground;
  }

  static Color getForeground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightForeground
        : darkForeground;
  }

  static Color getCard(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightCard
        : darkCard;
  }

  static Color getMuted(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightMuted
        : darkMuted;
  }

  static Color getBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightBorder
        : darkBorder;
  }
}
