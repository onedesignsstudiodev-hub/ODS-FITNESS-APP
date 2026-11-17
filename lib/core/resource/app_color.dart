// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();
  static final AppColor _instance = AppColor._internal();

  factory AppColor() {
    return _instance;
  }

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF08090A);
  static const Color transparent = Color(0x00000000);
  static const Color base = Color(0xFFF4F5F0);

  static const Color primary = Color(0xFF84BE40);
  static const Color success = Color(0xFF4CAF50);
  static const Color grey = Color(0xFFF5F5F5);
  static const Color highlight = Color(0xFFBEF264);
  static Color? get highlightdark => null;

  // >>>>>>>>>>>>>>>>>>>>>>> Text <<<<<<<<<<<<<<<<<<<<<<<

  static const Color primaryText = Color(0xFF08090A);
  static const Color secondaryText = Color(0xFFF4F5F0);
  static const Color headingText = Color(0xFF90A4AE);
  static const Color highlightText = Color(0xFFB0BEC5);
  static const Color baseText = Color(0xFFB0BEC5);

  static const Color disabledText = Color(0xFF90A4AE);
  static const Color errorText = Color(0xFFD32F2F);

  static const Gradient iconBgGradient = LinearGradient(
    colors: [Color(0xff00000000), Color(0xff000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
