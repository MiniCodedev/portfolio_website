import 'package:flutter/material.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:portfolio_website/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const ResponsiveLayout(),
    );
  }
}
