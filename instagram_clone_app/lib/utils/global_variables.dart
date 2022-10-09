import 'package:flutter/material.dart';
import 'package:instagram_clone_app/screens/add_post_screen.dart';
import 'package:instagram_clone_app/screens/feed_screen.dart';

import '../screens/profile_scree.dart';
import '../screens/search_screen.dart';

const webScreenSize = 600;
const homeScreen = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('data'),
  ProfileScreen(),
];
