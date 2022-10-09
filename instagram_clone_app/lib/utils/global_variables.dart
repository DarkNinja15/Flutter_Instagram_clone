import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/screens/add_post_screen.dart';
import 'package:instagram_clone_app/screens/feed_screen.dart';

import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreen = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('data'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
