import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone_app/responsive/web_scree_layout.dart';
import 'package:instagram_clone_app/utils/colors.dart';

import 'responsive/mobile_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
