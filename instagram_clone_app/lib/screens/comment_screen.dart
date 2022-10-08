import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/colors.dart';

import '../widgets/comment_card.dart';

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
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(
            right: 8,
            left: 16,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1665179489306-a5158530b8ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                ),
                radius: 18,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Comment as Username',
                        border: InputBorder.none),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
