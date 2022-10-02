import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/global_variables.dart';

class MobileScreenLayOut extends StatefulWidget {
  const MobileScreenLayOut({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayOut> createState() => _MobileScreenLayOutState();
}

class _MobileScreenLayOutState extends State<MobileScreenLayOut> {
  String username = "";

  getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snap.data());
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['email'];
    });
  }

  int _page = 0;
  late PageController _pageController;
  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    getUserName();
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
            onTap: navigationTapped,
            backgroundColor: mobileBackgroundColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _page == 0 ? primaryColor : secondaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: _page == 1 ? primaryColor : secondaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: _page == 2 ? primaryColor : secondaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: _page == 3 ? primaryColor : secondaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _page == 4 ? primaryColor : secondaryColor,
                ),
              ),
            ]),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: homeScreen,
          controller: _pageController,
          onPageChanged: onPageChanged,
        ));
  }
}
