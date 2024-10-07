import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/mobile/home_page_mobile.dart';
import 'package:portfolio_website/pages/windows/home_page_window.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const HomeMobilePage();
      } else {
        return const HomePageWindow();
      }
    });
  }
}
