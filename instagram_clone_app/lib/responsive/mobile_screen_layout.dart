import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          username,
        ),
      ),
    );
  }
}
