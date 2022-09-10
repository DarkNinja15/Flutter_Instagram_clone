import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayOut;
  final Widget mobileScreenLayOut;

  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayOut,
    required this.mobileScreenLayOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreenLayOut;
        }
        return mobileScreenLayOut;
      },
    );
  }
}
