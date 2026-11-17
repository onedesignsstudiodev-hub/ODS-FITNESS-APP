import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Applies status bar colors and icon brightness for an individual screen.
class AppSystemUiOverlay extends StatelessWidget {
  const AppSystemUiOverlay({
    super.key,
    required this.child,
    this.statusBarColor = Colors.transparent,
    this.iconBrightness = Brightness.dark,
  });

  final Widget child;
  final Color statusBarColor;
  final Brightness iconBrightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: iconBrightness,
        // iOS uses this field with the opposite convention to Android.
        statusBarBrightness: iconBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: child,
    );
  }
}
