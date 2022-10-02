import 'package:flutter/material.dart';
import 'package:instagram_clone_app/providers/user_provider.dart';
import 'package:instagram_clone_app/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayOut;
  final Widget mobileScreenLayOut;

  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayOut,
    required this.mobileScreenLayOut,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    await Provider.of<UserProvider>(context, listen: false).refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webScreenLayOut;
        }
        return widget.mobileScreenLayOut;
      },
    );
  }
}
