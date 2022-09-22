import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone_app/models/user.dart' as model;
import 'package:instagram_clone_app/resources/storage_methods.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;

  // signUp User
  Future<String> SignUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          bio: bio,
          email: email,
          followers: [],
          following: [],
          photoUrl: photoUrl,
          uid: cred.user!.uid,
          username: username,
        );

        // add user to firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(cred.user!.uid)
            .set(
              user.toMap(),
            );
        res = 'Success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // login user
  Future<String> LogInUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';
    try {
      UserCredential? cred;
      if (email.isNotEmpty || password.isNotEmpty) {
        cred = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      if (cred != null) {
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
      return res;
    } catch (e) {
      res = e.toString();
      return res;
    }
  }
}
