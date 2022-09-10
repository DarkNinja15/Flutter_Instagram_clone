import 'package:flutter/material.dart';
import 'package:instagram_clone_app/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone_app/responsive/web_scree_layout.dart';
import 'package:instagram_clone_app/utils/colors.dart';

import 'responsive/mobile_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram-Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        webScreenLayOut: WebScreenLayOut(),
        mobileScreenLayOut: MobileScreenLayOut(),
      ),
    );
  }
}
