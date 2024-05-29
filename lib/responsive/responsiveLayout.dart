import 'package:flutter/material.dart';
import 'package:whatsaap/layoutScreens/mobile_screen_layout.dart';
import 'package:whatsaap/layoutScreens/web_screen_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, responsive) {
      if (responsive.maxWidth > 938) {
        return WebScreenLayout();
      } else {
        return MobileScreenLayout();
      }
    });
  }
}
