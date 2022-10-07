import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/colors.dart';

class CommentScren extends StatefulWidget {
  const CommentScren({Key? key}) : super(key: key);

  @override
  State<CommentScren> createState() => _CommentScrenState();
}

class _CommentScrenState extends State<CommentScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
    );
  }
}
